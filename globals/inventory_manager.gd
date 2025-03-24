extends Node

var inventory: Array[String] = []
var selected_item = null

signal inventory_item_added(item)
signal inventory_item_selected(item)

func _ready():
  load_inventory()

func load_inventory():
  inventory = ["magnifying_glass", "smartphone", "headphones"]
    
func select_item(item):
  if inventory.has(item):
    selected_item = item
    emit_signal("inventory_item_selected", item)

func deselect_item():
  selected_item = null
  emit_signal("inventory_item_selected", null)

func add_item(item):
  if not inventory.has(item):
    inventory.append(item)
    emit_signal("inventory_item_added", item)
  
