extends Area2D

signal hit
signal win
onready var sprite = $Sprite
var playerCompletedTask = false
var mousePlayerCompletedTask = false


func _on_Task_body_entered(body):
	emit_signal("hit")
	playerCompletedTask = true
	if mousePlayerCompletedTask:
		completeTask()
	else:
		changeState("res://assets/player_completed_task.png")

func _physics_process(delta):
	if Input.is_action_just_pressed("right_click"):
		mousePlayerCompletedTask = true
		if playerCompletedTask:
			completeTask()
		else: 
			changeState("res://assets/mouse_player_completed_task.png")
		

func changeState(textureRoute):
	sprite.texture = ResourceLoader.load(textureRoute)

func completeTask():
	changeState("res://assets/task_completed.png")
	emit_signal("win")
	
func reset():
	playerCompletedTask = false
	mousePlayerCompletedTask = false
	changeState("res://assets/task.png")
	
