extends KinematicBody2D

export var speed = 500
const acc = 50
var screen_size
var velocity: Vector2 = Vector2.ZERO
var job

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	_process_input()
	

func _on_WorkArea_body_entered(body):
	job = body# Replace with function body.

func _on_WorkArea_body_exited(body):
	job = null

func _process_input() -> void:
	if Input.is_action_just_pressed("execute_job"):
		_execute_job()
	
	var x_direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var y_direction:int = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	if (x_direction == 0):
		velocity.x = 0
	if (y_direction == 0):
		velocity.y = 0
	
	velocity.x += x_direction * speed 
	velocity.y += y_direction * speed 
	velocity.x = clamp(velocity.x, -speed, speed)
	velocity.y = clamp(velocity.y, -speed, speed)
	
	velocity = move_and_slide(velocity)

func _execute_job():
	if job:
		job.work_by_kb()
