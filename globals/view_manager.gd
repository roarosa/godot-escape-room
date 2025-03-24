extends Node

signal view_updated(view)

enum View {EXPLORE, INVENTORY, LETTERS}

var active_view: View = View.EXPLORE

func change_view(view: View):
  active_view = view
  emit_signal("view_updated", view)
