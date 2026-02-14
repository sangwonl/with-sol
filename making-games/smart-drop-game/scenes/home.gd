extends Control

@onready var en_btn = $VBoxContainer/LangToggle/EnBtn
@onready var ko_btn = $VBoxContainer/LangToggle/KoBtn

func _ready() -> void:
	_update_best_scores()
	_update_lang_buttons()

func _update_best_scores():
	$VBoxContainer/SubjectButtons/MathButton/BestScore.text = tr("BEST_FORMAT") % Global.best_scores["math"]
	$VBoxContainer/SubjectButtons/ChineseButton/BestScore.text = tr("BEST_FORMAT") % Global.best_scores["chinese"]
	$VBoxContainer/SubjectButtons/EnglishButton/BestScore.text = tr("BEST_FORMAT") % Global.best_scores["english"]

func _update_lang_buttons():
	if Global.locale == "en":
		en_btn.add_theme_stylebox_override("normal", _make_lang_style(true))
		ko_btn.add_theme_stylebox_override("normal", _make_lang_style(false))
	else:
		ko_btn.add_theme_stylebox_override("normal", _make_lang_style(true))
		en_btn.add_theme_stylebox_override("normal", _make_lang_style(false))

func _make_lang_style(selected: bool) -> StyleBoxFlat:
	var style = StyleBoxFlat.new()
	style.bg_color = Color(1, 0.835, 0.31, 1) if selected else Color(1, 1, 1, 0.6)
	style.border_width_left = 2
	style.border_width_top = 2
	style.border_width_right = 2
	style.border_width_bottom = 2
	style.border_color = Color(0.176, 0.204, 0.212, 1)
	style.corner_radius_top_left = 8
	style.corner_radius_top_right = 8
	style.corner_radius_bottom_right = 8
	style.corner_radius_bottom_left = 8
	style.content_margin_left = 12.0
	style.content_margin_top = 4.0
	style.content_margin_right = 12.0
	style.content_margin_bottom = 4.0
	return style

func _on_en_pressed() -> void:
	Global.set_locale("en")
	get_tree().reload_current_scene()

func _on_ko_pressed() -> void:
	Global.set_locale("ko")
	get_tree().reload_current_scene()

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
