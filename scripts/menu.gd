extends VBoxContainer

func _ready():
  $Explore.pressed.connect(
    ViewManager.change_view.bind(ViewManager.View.EXPLORE)
  )
  $Inventory.pressed.connect(
    ViewManager.change_view.bind(ViewManager.View.INVENTORY)
  )
  $Letters.pressed.connect(
    ViewManager.change_view.bind(ViewManager.View.LETTERS)
  )
