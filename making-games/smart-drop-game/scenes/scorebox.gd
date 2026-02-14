extends Control

func _ready() -> void:
	pass

func update_score(correct: int, missed: int, index: int, total: int):
	$PanelContainer/HBoxContainer/PassLabel.text = tr("PASS_FORMAT") % correct
	$PanelContainer/HBoxContainer/MissLabel.text = tr("MISS_FORMAT") % missed
	$PanelContainer/HBoxContainer/Score.text = tr("SCORE_FORMAT") % [index, total]

func _on_back_pressed() -> void:
	AudioManager.play_sfx("click")
	get_tree().change_scene_to_file("res://scenes/home.tscn")
