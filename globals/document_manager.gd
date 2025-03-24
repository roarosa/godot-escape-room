extends Node

var documents = {}

signal document_selected(title, content)

func _ready():
    load_documents()

func load_documents():
    documents = {
        "Missing Person Report": "Text of report goes here...",
        "Strange Markings": "The symbols appear to be..."
    }
    
func select_document(title):
    if documents.has(title):
        emit_signal("document_selected", title, documents[title])
