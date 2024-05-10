extends KinematicBody2D
export var speed = 400
var screen_size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):

	var x_direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var y_direction:int = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))

	position.x += x_direction * speed * delta
	position.y += y_direction * speed * delta




