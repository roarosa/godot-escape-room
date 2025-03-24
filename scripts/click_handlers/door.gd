extends Node

func on_click(node):
  if InventoryManager.selected_item:
    if InventoryManager.selected_item == "key":
      # ObservationManager.set_temporary_observation("I'm free!")
      node.get_tree().change_scene_to_file("res://win.tscn")
    else:
      ObservationManager.set_temporary_observation("Nothing happens.")
  else:
    ObservationManager.set_temporary_observation("It seems to be locked...")
