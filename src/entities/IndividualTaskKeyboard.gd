extends IndividualTask
class_name IndividualTaskKeyboard
signal done
onready var sprite = $Sprite
onready var label = $Sprite/Label

var disable = false
var steps: int

func setup(resource: IndividualTaskResource) -> void:
	steps = resource.clicks_amount
	position = resource.task_pos
		
func _ready():
	label.text = str(steps)

func work():
	if steps > 1:
		steps -= 1
		label.text = str(steps)
	else:
		completeTask() 
		

func completeTask():
	print("done job")
	emit_signal("done")
	queue_free()

