extends Node

onready var gui = $CanvasLayer/GUI
onready var defeat_menu = $CanvasLayer/DefeatMenu
onready var remaining_time = $RemainingTime
onready var win_menu = $CanvasLayer/WinMenu
onready var task = $Task

var tasks = 0

func _ready():
	remaining_time.start()
	count_tasks()
	print(tasks)
	
func _on_RemainingTime_timeout():
	gui.update_score(1)

func game_over():
	remaining_time.stop()
	defeat_menu.show()
	defeat_menu.play_sound()
	get_tree().paused = true
	

func _on_DefeatMenu_restart_requested():
	gui.restart() 
	remaining_time.start()
	defeat_menu.hide()
	get_tree().paused = false
	get_tree().change_scene("res://src/Level.tscn")

func _on_WinMenu_restart_requested():
	gui.restart() 
	remaining_time.start()
	win_menu.hide()
	get_tree().paused = false
	get_tree().change_scene("res://src/Level.tscn")
	
func count_tasks():
	var all_childs = get_child_count()
	for i in all_childs:
		var child = get_child(i)
		if child is Task:
			child.connect("done", self, "_on_Task_done")
			tasks += 1

func _on_Task_done():
	_update_done()

func _update_done():
	tasks -= 1
	print(tasks)
	if tasks == 0:
		win_menu.show()
		win_menu.play_sound()
		remaining_time.stop()
		get_tree().paused = true

	
