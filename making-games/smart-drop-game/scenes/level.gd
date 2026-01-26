extends Node

var correct := 0
var missed := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('ready')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_question_missed() -> void:
	missed += 1
	print(missed)
