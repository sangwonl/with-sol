extends Control

@onready var score_label = $VBoxContainer/ScorePanel/VBoxContainer/ScoreLabel
@onready var pass_label = $VBoxContainer/ScorePanel/VBoxContainer/PassLabel
@onready var miss_label = $VBoxContainer/ScorePanel/VBoxContainer/MissLabel
@onready var new_best_label = $VBoxContainer/NewBestLabel

func _ready() -> void:
	var correct = Global.last_correct
	var missed = Global.last_missed
	var total = Global.last_total

	score_label.text = tr("SCORE_FORMAT") % [correct, total]
	pass_label.text = tr("PASS_FORMAT") % correct
	miss_label.text = tr("MISS_FORMAT") % missed

	var prev_best = Global.best_scores.get(Global.subject, 0)
	if correct > prev_best:
		Global.save_best_score(Global.subject, correct)
		new_best_label.text = tr("NEW_BEST")
		new_best_label.visible = true
	else:
		new_best_label.visible = false

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
