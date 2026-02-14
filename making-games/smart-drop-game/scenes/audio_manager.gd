extends Node

var bgm_player: AudioStreamPlayer
var sfx_map: Dictionary = {}

func _ready():
	bgm_player = AudioStreamPlayer.new()
	bgm_player.bus = "Music"
	add_child(bgm_player)

	sfx_map = {
		"click": preload("res://audio/sfx/click.ogg"),
		"correct": preload("res://audio/sfx/correct.ogg"),
		"wrong": preload("res://audio/sfx/wrong.ogg"),
		"miss": preload("res://audio/sfx/miss.ogg"),
		"gameover": preload("res://audio/sfx/gameover.ogg"),
		"newbest": preload("res://audio/sfx/newbest.ogg"),
	}

func play_bgm(name: String):
	var stream = load("res://audio/bgm/" + name + ".ogg")
	if bgm_player.stream == stream and bgm_player.playing:
		return
	bgm_player.stream = stream
	bgm_player.stream.loop = true
	bgm_player.play()

func stop_bgm():
	bgm_player.stop()

func play_sfx(name: String):
	if sfx_map.has(name):
		var player = AudioStreamPlayer.new()
		player.stream = sfx_map[name]
		player.bus = "SFX"
		add_child(player)
		player.play()
		player.finished.connect(player.queue_free)
