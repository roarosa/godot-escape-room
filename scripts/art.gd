@tool
extends Node2D

func _draw():
  draw_rect(
    Rect2(
      Vector2(0, 0),
      Vector2(250, 150)
    ),
    Color.GOLDENROD,
    true
  )
  draw_rect(
    Rect2(
      Vector2(10, 10),
      Vector2(230, 130)
    ),
    Color.LIGHT_SKY_BLUE,
    true
  )
  draw_rect(
    Rect2(
      Vector2(10, 80),
      Vector2(230, 60)
    ),
    Color.FOREST_GREEN,
    true
  )
  draw_circle(
    Vector2(50, 70),
    25,
    Color.WHITE,
  )
  draw_circle(
    Vector2(100, 75),
    15,
    Color.WHITE,
  )
