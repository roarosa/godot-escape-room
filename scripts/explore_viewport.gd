extends SubViewportContainer

var cursor_shape = null

func _ready():
  mouse_entered.connect(_on_viewport_mouse_entered)
  mouse_exited.connect(_on_viewport_mouse_exited)
  InventoryManager.inventory_item_selected.connect(_on_inventory_item_selected)

func _exit_tree():
  Input.set_custom_mouse_cursor(null)

func _on_inventory_item_selected(item):
  cursor_shape = load("res://icons/inventory_cursors/%s.svg" % item)

func _on_viewport_mouse_entered():
  if cursor_shape:
    Input.set_custom_mouse_cursor(cursor_shape)

func _on_viewport_mouse_exited():
  Input.set_custom_mouse_cursor(null)
