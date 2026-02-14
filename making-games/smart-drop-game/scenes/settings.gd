extends Control

var selected_time: float = 5.0
var selected_difficulty: String = "normal"

func _ready() -> void:
	_update_difficulty_labels()
	_update_time_buttons()
	_update_difficulty_buttons()

func _update_difficulty_labels():
	var easy_btn = $VBoxContainer/DifficultySection/DifficultyButtons/Easy
	var normal_btn = $VBoxContainer/DifficultySection/DifficultyButtons/Normal
	var hard_btn = $VBoxContainer/DifficultySection/DifficultyButtons/Hard
	easy_btn.text = tr("DIFF_EASY") + "\n" + tr("DIFF_EASY_DESC")
	normal_btn.text = tr("DIFF_NORMAL") + "\n" + tr("DIFF_NORMAL_DESC")
	hard_btn.text = tr("DIFF_HARD") + "\n" + tr("DIFF_HARD_DESC")

func _update_time_buttons():
	var time_buttons = $VBoxContainer/TimeSection/TimeButtons.get_children()
	var times = [2.0, 5.0, 10.0, 20.0]
	for i in range(time_buttons.size()):
		var btn = time_buttons[i]
		if times[i] == selected_time:
			btn.add_theme_stylebox_override("normal", _get_selected_style())
		else:
			btn.remove_theme_stylebox_override("normal")

func _update_difficulty_buttons():
	var diff_buttons = $VBoxContainer/DifficultySection/DifficultyButtons.get_children()
	var diffs = ["easy", "normal", "hard"]
	for i in range(diff_buttons.size()):
		var btn = diff_buttons[i]
		if diffs[i] == selected_difficulty:
			btn.add_theme_stylebox_override("normal", _get_selected_style())
		else:
			btn.remove_theme_stylebox_override("normal")

func _get_selected_style() -> StyleBoxFlat:
	var style = StyleBoxFlat.new()
	style.bg_color = Color(1, 0.835, 0.31, 1)  # Golden yellow
	style.border_width_left = 3
	style.border_width_top = 3
	style.border_width_right = 3
	style.border_width_bottom = 3
	style.border_color = Color(0.176, 0.204, 0.212, 1)
	style.corner_radius_top_left = 12
	style.corner_radius_top_right = 12
	style.corner_radius_bottom_right = 12
	style.corner_radius_bottom_left = 12
	style.shadow_color = Color(0, 0, 0, 0.3)
	style.shadow_size = 4
	return style

func _on_time_2s_pressed() -> void:
	selected_time = 2.0
	_update_time_buttons()

func _on_time_5s_pressed() -> void:
	selected_time = 5.0
	_update_time_buttons()

func _on_time_10s_pressed() -> void:
	selected_time = 10.0
	_update_time_buttons()

func _on_time_20s_pressed() -> void:
	selected_time = 20.0
	_update_time_buttons()

func _on_easy_pressed() -> void:
	selected_difficulty = "easy"
	_update_difficulty_buttons()

func _on_normal_pressed() -> void:
	selected_difficulty = "normal"
	_update_difficulty_buttons()

func _on_hard_pressed() -> void:
	selected_difficulty = "hard"
	_update_difficulty_buttons()

func _on_start_pressed() -> void:
	Global.time_per_question = selected_time
	Global.difficulty = selected_difficulty
	get_tree().change_scene_to_file("res://scenes/ingame.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")
