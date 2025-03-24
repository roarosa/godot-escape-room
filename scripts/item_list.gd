@tool
extends GridContainer

@export var rows: int = 5
@export var selected_style: StyleBoxFlat
@export var unselected_style: StyleBoxFlat

var shader = preload("res://main.gdshader")

var selected_index: int = -1

func _ready():
  var inventory
  var selected_item
  if Engine.is_editor_hint():
    inventory = ["key", "headphones", "smartphone"]
    selected_item = "smartphone"
  else:
    inventory = InventoryManager.inventory
    selected_item = InventoryManager.selected_item
    InventoryManager.inventory_item_selected.connect(_update_selected_item)
    InventoryManager.inventory_item_added.connect(_add_item)

  for i in range(self.columns * rows):
    var item = inventory[i] if i < inventory.size() else null
    var selected = item != null && item == selected_item
    if selected:
      selected_index = i
    add_inventory_slot(item, selected)
  
    
func _update_selected_item(item):
  if selected_index != -1:
    var old_selected_panel: Panel = get_child(selected_index)
    old_selected_panel.add_theme_stylebox_override("panel", unselected_style)
  selected_index = InventoryManager.inventory.find(item)
  if selected_index != -1:
    var new_selected_panel: Panel = get_child(selected_index)
    new_selected_panel.add_theme_stylebox_override("panel", selected_style)
    
func _add_item(item):
  var slot = get_child(InventoryManager.inventory.size() - 1)
  slot.add_child(make_inventory_button(item))
  

func add_inventory_slot(item, selected=false):
  var slot = Panel.new()
  slot.custom_minimum_size = Vector2(100, 100)
  slot.add_theme_stylebox_override(
    "panel",
    selected_style if selected else unselected_style
  )

  if item:
    slot.add_child(make_inventory_button(item))

  add_child(slot)
  
func make_inventory_button(item):
  var button = TextureButton.new()
  
  button.texture_normal = load("res://icons/inventory/%s.svg" % item)
  var button_material = ShaderMaterial.new()
  button_material.shader = shader
  button_material.set_shader_parameter("color", Color.WHITE)
  button.material = button_material

  button.ignore_texture_size = true
  button.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
  button.anchor_left = 0
  button.anchor_top = 0
  button.anchor_right = 1
  button.anchor_bottom = 1
  button.offset_left = 15
  button.offset_top = 15
  button.offset_right = -15
  button.offset_bottom = -15
  
  if not Engine.is_editor_hint():
    button.pressed.connect(_handle_item_clicked.bind(item))
  
  return button

func _handle_item_clicked(item):
  if InventoryManager.selected_item == item:
    InventoryManager.deselect_item()
  else:
    InventoryManager.select_item(item)
