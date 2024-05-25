extends Node

onready var gui = $CanvasLayer/GUI
onready var defeat_menu = $CanvasLayer/DefeatMenu
onready var remaining_time = $RemainingTime
onready var win_menu = $CanvasLayer/WinMenu
onready var task_manager = $TaskManager
#onready var task = $IndividualTask


onready var task_stack_resource = preload("res://src/entities/task_stack_resource.tres") as TaskStackResource
var tasks = 2
func _ready():
	remaining_time.start()
	task_manager.set_task_stack_resource(task_stack_resource)
	task_manager.connect("all_tasks_completed", self, "_on_all_tasks_completed")
	task_manager.connect("task_completed", self, "_on_task_completed")
	#count_tasks()
	#print(tasks)
	
func _on_RemainingTime_timeout():
	gui.update_score(1)

func game_over():
	remaining_time.stop()
	defeat_menu.show()
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
	
#func count_tasks():
#	var all_childs = get_child_count()
#	for i in all_childs:
#		var child = get_child(i)
#		if child is IndividualTask:
#			child.connect("done", self, "_on_Task_done")
#			tasks += 1
func _on_all_tasks_completed():
	remaining_time.stop()
	win_menu.show()
	get_tree().paused = true
	
func _on_Task_done():
	_update_done()

func _update_done():
	
	tasks -= 1
	print(tasks)
	if tasks == 0:
		win_menu.show()
		remaining_time.stop()
		get_tree().paused = true
