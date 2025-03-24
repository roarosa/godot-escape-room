@tool
extends Node2D

func _draw():
  var wall_rect = Rect2(Vector2(0, 0), Vector2(3000, 350))
  draw_rect(wall_rect, Color.DARK_GREEN, true)
  var floor_rect = Rect2(Vector2(0, 350), Vector2(3000, 350))
  draw_rect(floor_rect, Color.PALE_GOLDENROD, true)
