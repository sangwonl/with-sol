extends Node2D

signal missed

var first_value := 0
var second_value := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	first_value = random_digits(3)
	second_value = random_digits(3)
	
	$Text.text = "{a} + {b}".format({
		"a": first_value,
		"b": second_value,
	})

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position + Vector2(0.0, 1.0) * 150 * delta
	if position.y > Global.bottomLineY:
		missed.emit()
		queue_free()
	
func random_digits(digits: int) -> int:
	if digits <= 0:
		return 0

	var min_value := int(pow(10, digits - 1))
	var max_value := int(pow(10, digits)) - 1

	return randi_range(min_value, max_value)
