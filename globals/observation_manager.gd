extends Node

signal observation_text_updated(text)

var active_text
var active_item
var active_timer
var delay_time_s = 1.5

func update_observation_item(item: ExploreItem):
  if active_item != item:
    active_item = item
    if not active_timer:
      _update_text(item.get_hover_description())
  
func clear_observation_item(item: ExploreItem):
  # check for the item match so we don't accidentally
  # clear after moving to a different item
  if active_item == item:
    active_item = null
    if not active_timer:
      _update_text(null)

func set_temporary_observation(text):
  if (active_timer):
    remove_child(active_timer)
  _update_text(text)
  var timer = Timer.new()
  timer.wait_time = delay_time_s
  timer.one_shot = true
  timer.timeout.connect(_reset_message)
  timer.autostart = true
  active_timer = timer
  add_child(timer)
    

func _update_text(text):
  active_text = active_text
  emit_signal("observation_text_updated", text)

func _reset_message():
  _update_text(active_item.get_hover_description() if active_item else null)
  if active_timer:
    remove_child(active_timer)
    active_timer = null
  
