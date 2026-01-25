extends Control

@onready var buttons = [
	$PanelContainer/HBoxContainer/Button1,
	$PanelContainer/HBoxContainer/Button2,
	$PanelContainer/HBoxContainer/Button3,
	$PanelContainer/HBoxContainer/Button4,
	$PanelContainer/HBoxContainer/Button5
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(buttons.size()):
		buttons[i].set_meta("value", i + 30)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed(index: int) -> void:
	print("button pressed: %d-%d" % [index, buttons[index].get_meta("value")])
