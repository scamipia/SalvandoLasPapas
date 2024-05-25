extends StaticBody2D
class_name IndividualTask

signal hit
signal win
signal done
onready var sprite = $Sprite
onready var label = $Sprite/Label
var playerCompletedTask = false
var mousePlayerCompletedTask = false
var isAvailable = false
var steps
export (int) var totalSteps: int = 5
#si es true es el pj 2d si es false es el mouse
#en los colores es azul para pj 2d y rojo para mouse
export (bool) var worker: bool = true
export (int) var stages: int = 2

func _ready():
	print("ready")
	resetSteps()
	resetWorker()
	
func work():
	if steps > 1:
		steps -= 1
		label.text = str(steps)
	else:
		completeTask() 
	
func _on_Task_body_entered(body):
	emit_signal("hit")
	playerCompletedTask = true
	if mousePlayerCompletedTask:
		completeTask()
	else:
		changeState("res://assets/player_completed_task.png")

func _physics_process(delta):
	if Input.is_action_just_pressed("right_click"):
		if isAvailable && !worker:
			work_by_mouse()
		

func changeState(textureRoute):
	sprite.texture = ResourceLoader.load(textureRoute)

func completeTask():
	stages = stages - 1
	if stages == 0:
		emit_signal("done")
		queue_free()
	else:
		changeWorker()
	
func changeWorker():
	worker = !worker
	if(worker):
		changeState("./assets/Blue-Circle.png")
	else:
		changeState("./assets/Red-Circle.png")
	resetSteps()	

func reset():
	resetSteps()
	resetWorker()
	print("reset")

func _on_AvailabilityArea_body_entered(body):
	isAvailable = false
	print(body.name)

func _on_AvailabilityArea_body_exited(body):
	isAvailable = false
	print(body.name)

func resetSteps():
	steps = totalSteps
	if label:
		label.text = str(totalSteps)
		
	
func resetWorker():
	if worker:
		changeState("./assets/Blue-Circle.png")
	else: 
		changeState("./assets/Red-Circle.png")
	
func work_by_kb():
	if worker:
		work()
		
func work_by_mouse():
	if !worker:
		work()

func _on_AvailabilityArea_mouse_entered():
	isAvailable = true
	print("mouse entered")


func _on_AvailabilityArea_mouse_exited():
	isAvailable = false
	print("mouse exited")
