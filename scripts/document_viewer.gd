extends ScrollContainer


func _ready():
  DocumentManager.document_selected.connect(_document_selected)


func _document_selected(_title, content):
  $RichTextLabel.text = content
