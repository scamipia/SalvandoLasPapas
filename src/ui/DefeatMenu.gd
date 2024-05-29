extends Control

signal restart_requested

onready var defeat_menu_audio = $DefeatMenuAudio


func _ready():
	hide()

func _on_RestartButton_pressed():
	emit_signal("restart_requested") # Replace with function body.
	

func _on_BackToMenu_pressed():
	get_tree().set_pause(false)
	var new_scene = load("res://src/Main.tscn")
	get_tree().change_scene_to(new_scene)
	queue_free() # Replace with function body.

func play_sound():
	defeat_menu_audio.play()
