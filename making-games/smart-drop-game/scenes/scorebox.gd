extends Control

func update_score(correct: int, missed: int, index: int, total: int):
	var scoreText = "Pass: %d Missed: %d (%d / %d)" % [correct, missed, index, total]
	$PanelContainer/HBoxContainer/Score.text = scoreText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
