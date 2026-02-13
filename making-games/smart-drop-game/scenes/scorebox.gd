extends Control

func _ready() -> void:
	pass

func update_score(correct: int, missed: int, index: int, total: int):
	$PanelContainer/HBoxContainer/PassLabel.text = "Pass: %d" % correct
	$PanelContainer/HBoxContainer/MissLabel.text = "Miss: %d" % missed
	$PanelContainer/HBoxContainer/Score.text = "%d / %d" % [index, total]

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")
