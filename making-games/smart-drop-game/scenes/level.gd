extends Node

var question_scene = preload("res://scenes/question.tscn")
@onready var minibox = $CanvasLayer/VBoxContainer/MiniBox

var correct := 0
var missed := 0

var cur_question = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_question()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_question():
	# setup question
	var question = question_scene.instantiate()

	var speed = 100
	var a = random_digits(2)
	var b = random_digits(2)
	question.setup(a, b, speed)
	
	var viewport = get_viewport().get_visible_rect()
	var pos_x = randi_range(0, viewport.size.x)
	question.position = Vector2(pos_x, 0)
	
	question.answered.connect(_on_question_answered)
	question.missed.connect(_on_question_missed)
		
	add_child(question)
	cur_question = question
	
	# setup minibox
	var answer = a + b
	var option_values = get_random_unique(4, answer - 200, answer + 200)
	option_values.append(answer)
	option_values.shuffle()
	minibox.setup(option_values)
	
func _on_question_missed() -> void:
	missed += 1
	print('correct: %d, missed: %d' % [correct, missed])
	spawn_question()

func _on_question_answered(is_correct: bool):
	if is_correct:
		correct += 1
	else:
		missed += 1
	print('correct: %d, missed: %d' % [correct, missed])
	spawn_question()

func _on_answer_selected(value: int) -> void:
	print("selected: %d" % value)
	cur_question.check_answer(value)

func random_digits(digits: int) -> int:
	if digits <= 0:
		return 0

	var min_value := int(pow(10, digits - 1))
	var max_value := int(pow(10, digits)) - 1

	return randi_range(min_value, max_value)

func get_random_unique(count: int, min_value: int, max_value: int) -> Array[int]:
	var pool = range(min_value, max_value + 1)  # [1, 2, 3, ..., max_value]
	var result: Array[int] = []
	
	for i in count:
		var index = randi() % pool.size()
		result.append(pool[index])
		pool.remove_at(index)
	
	return result
