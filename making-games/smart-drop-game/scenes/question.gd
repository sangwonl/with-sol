extends Node2D

signal answered(is_correct: bool, is_miss: bool)

var first_value := 0
var second_value := 0
var answer := 0
var drop_speed := 0

func setup(first, second, speed):
	first_value = first
	second_value = second
	answer = first_value + second_value
	drop_speed = speed

	$Text.text = "{a} + {b}".format({
		"a": first_value,
		"b": second_value,
	})

func check_answer(selected_answer: int):
	var is_correct = selected_answer == answer
	answered.emit(is_correct, false)
	queue_free()

func _ready() -> void:
	# Auto-size label to fit content and center it on the node origin
	$Text.size = Vector2.ZERO
	$Text.position.x = -$Text.size.x / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	const buffer = 30
	position += Vector2(0.0, 1.0) * drop_speed * delta
	if position.y > Global.bottom_line_y - buffer:
		AudioManager.play_sfx("miss")
		answered.emit(false, true)
		queue_free()
