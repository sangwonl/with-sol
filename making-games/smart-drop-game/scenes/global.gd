extends Node

var top_line_y: float = 0
var bottom_line_y: float = 0

# Last game results (for report scene)
var last_correct := 0
var last_missed := 0
var last_total := 0

# Game settings
var time_per_question: float = 5.0  # seconds: 2, 5, 10, 20
var difficulty: String = "normal"    # easy, normal, hard
var subject: String = "math"         # math, chinese, english

# Best scores per subject
var best_scores: Dictionary = {
	"math": 0,
	"chinese": 0,
	"english": 0
}

# Language
var locale: String = "en"

func get_digit_range() -> Dictionary:
	match difficulty:
		"easy":
			return {"min": 1, "max": 9}
		"normal":
			return {"min": 1, "max": 99}
		"hard":
			return {"min": 1, "max": 999}
		_:
			return {"min": 1, "max": 99}

const SAVE_PATH = "user://save_data.save"

func save_best_score(subject: String, score: int):
	if score > best_scores.get(subject, 0):
		best_scores[subject] = score
		_save_to_file()

func set_locale(new_locale: String):
	locale = new_locale
	TranslationServer.set_locale(locale)
	_apply_font_weight()
	_save_to_file()

func _save_to_file():
	var data = {
		"best_scores": best_scores,
		"locale": locale
	}
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))

func _load_from_file():
	if not FileAccess.file_exists(SAVE_PATH):
		# Try migrating old save format
		_migrate_old_save()
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	if data is Dictionary:
		if data.has("best_scores") and data["best_scores"] is Dictionary:
			for key in data["best_scores"]:
				best_scores[key] = int(data["best_scores"][key])
		if data.has("locale"):
			locale = data["locale"]

func _migrate_old_save():
	var old_path = "user://best_scores.save"
	if not FileAccess.file_exists(old_path):
		return
	var file = FileAccess.open(old_path, FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	if data is Dictionary:
		for key in data:
			best_scores[key] = int(data[key])
	_save_to_file()

func _apply_font_weight():
	var theme = ThemeDB.get_project_theme()
	if not theme:
		return
	if locale == "ko":
		var font = FontVariation.new()
		font.variation_embolden = 0.4
		theme.default_font = font
	else:
		theme.default_font = null

func _ready() -> void:
	_load_from_file()
	TranslationServer.set_locale(locale)
	_apply_font_weight()
