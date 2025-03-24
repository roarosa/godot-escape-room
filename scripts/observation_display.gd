extends RichTextLabel

@export var default_text = "..."

func _ready():
  _update_content(ObservationManager.active_text)
  ObservationManager.observation_text_updated.connect(_update_content)
  size = get_parent().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update_content(new_text):
  var content = new_text if new_text else default_text
  text = "[center]%s[/center]" % content
