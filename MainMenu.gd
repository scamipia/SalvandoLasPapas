extends Node

func _on_StartButton_pressed():
	var new_scene = preload("res://src/Level.tscn")
	get_tree().change_scene_to(new_scene)


func _on_ExitButton_pressed():
	get_tree().quit()
