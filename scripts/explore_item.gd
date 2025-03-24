class_name ExploreItem
extends Area2D

@export var description: String
@export var clicked_description: String
@export var click_script: Script

func _ready():
  mouse_entered.connect(_on_mouse_entered)
  mouse_exited.connect(_on_mouse_exited)
  input_event.connect(_on_event)

func _on_mouse_entered():
  ObservationManager.update_observation_item(self)

func _on_mouse_exited():
  ObservationManager.clear_observation_item(self)

func _on_event(_viewport, event, _shape_idx):
  if event is InputEventMouseButton and event.pressed:
    if click_script and click_script.can_instantiate():
      var ins = click_script.new()
      if ins.has_method("on_click"):
        ins.on_click(self)
    elif InventoryManager.selected_item:
      ObservationManager.set_temporary_observation("Nothing happens.")
    elif clicked_description:
      ObservationManager.set_temporary_observation(clicked_description)

func get_hover_description():
  return description
