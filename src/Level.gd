extends Node

onready var gui = $CanvasLayer/GUI
onready var defeat_menu = $CanvasLayer/DefeatMenu
onready var remaining_time = $RemainingTime
onready var win_menu = $CanvasLayer/WinMenu
onready var task = $Task

func _ready():
	remaining_time.start()
	
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


func _on_Task_win():
	remaining_time.stop()
	win_menu.show()
	get_tree().paused = true


func _on_WinMenu_restart_requested():
	gui.restart() 
	remaining_time.start()
	win_menu.hide()
	get_tree().paused = false
	task.reset()
