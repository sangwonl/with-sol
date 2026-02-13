extends Node

var top_line_y: float = 0
var bottom_line_y: float = 0

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

func save_best_score(subject: String, score: int):
	if score > best_scores.get(subject, 0):
		best_scores[subject] = score

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
