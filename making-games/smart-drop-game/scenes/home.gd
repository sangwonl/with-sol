extends Control

func _ready() -> void:
	_update_best_scores()

func _update_best_scores():
	$VBoxContainer/SubjectButtons/MathButton/BestScore.text = "Best: %d" % Global.best_scores["math"]
	$VBoxContainer/SubjectButtons/ChineseButton/BestScore.text = "Best: %d" % Global.best_scores["chinese"]
	$VBoxContainer/SubjectButtons/EnglishButton/BestScore.text = "Best: %d" % Global.best_scores["english"]

func _on_math_pressed() -> void:
	Global.subject = "math"
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_chinese_pressed() -> void:
	# Not implemented yet
	pass

func _on_english_pressed() -> void:
	# Not implemented yet
	pass

func _on_exit_pressed() -> void:
	get_tree().quit()
