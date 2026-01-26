extends Control

signal selected

@onready var buttons = [
	$PanelContainer/HBoxContainer/Button1,
	$PanelContainer/HBoxContainer/Button2,
	$PanelContainer/HBoxContainer/Button3,
	$PanelContainer/HBoxContainer/Button4,
	$PanelContainer/HBoxContainer/Button5
]

func setup(values: Array[int]):
	for i in range(buttons.size()):
		var btn: Button = buttons[i]
		var v = values[i]
		btn.set_meta("value", v)
		btn.text = str(v)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.bottom_line_y = $PanelContainer.global_position.y	
	print('bottom line: %d' % Global.bottom_line_y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed(index: int) -> void:
	var selected_button = buttons[index]
	var selected_value = selected_button.get_meta("value")
	selected.emit(selected_value)
