extends Control

func _ready():
	hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("pause_menu"):
		visible = !visible
		get_tree().paused = visible

func _on_ResumeButton_pressed():
	hide()
	get_tree().paused = false


func _on_BackToMenu_pressed():
	get_tree().set_pause(false)
	var new_scene = load("res://src/Main.tscn")
	get_tree().change_scene_to(new_scene)
	queue_free()

