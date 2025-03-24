extends VBoxContainer


func _ready():
  for title in DocumentManager.documents.keys():
    var button = Button.new()
    button.text = title
    button.connect("pressed", DocumentManager.select_document.bind(title))
    add_child(button)
