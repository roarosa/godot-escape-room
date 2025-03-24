extends MarginContainer


func _ready():
  ViewManager.view_updated.connect(_update_view)
  _update_view(ViewManager.active_view)


func _update_view(view: ViewManager.View):
  $ExploreView.visible = view == ViewManager.View.EXPLORE
  $LettersView.visible = view == ViewManager.View.LETTERS
  $InventoryView.visible = view == ViewManager.View.INVENTORY
