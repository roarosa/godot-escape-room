extends Control

func _ready():
  gui_input.connect(_on_click)  

func _on_click(event):
  if event is InputEventMouseButton and event.pressed:
    get_tree().quit()
