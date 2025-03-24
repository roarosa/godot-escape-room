extends Node

func on_click(_node):
  if InventoryManager.selected_item:
    if InventoryManager.selected_item == "key":
      ObservationManager.set_temporary_observation("I'm not putting it back!")
    else:
      ObservationManager.set_temporary_observation("I want to keep that for now.")
    return
  var key_already_found = InventoryManager.inventory.has("key")
  if key_already_found:
    ObservationManager.set_temporary_observation("I already got a key from here.")
  else:
    ObservationManager.set_temporary_observation("I found a key!")
    InventoryManager.add_item("key")
