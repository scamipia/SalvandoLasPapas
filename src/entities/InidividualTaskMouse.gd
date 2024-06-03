extends IndividualTask 
class_name IndividualTaskMouse
signal done
onready var sprite = $Sprite
onready var label = $Sprite/Label
var isAvailable = false
var disable = false
var steps: int

onready var audio_stream_player = $AudioStreamPlayer
export (AudioStream) var saw_sound_effect



func setup(resource: IndividualTaskResource) -> void:
	steps = resource.clicks_amount
	position = resource.task_pos
		
func _ready():
	label.text = str(steps)

func work():
	print("tarea para mouse")
		

func completeTask():
	emit_signal("done")
	queue_free()

func _physics_process(delta):
	if Input.is_action_just_pressed("right_click"):
		if isAvailable: 
			execute()

func execute():
	if steps > 1:
		steps -= 1
		label.text = str(steps)
		play_sound_effect()
	else:
		completeTask() 

func _on_AvailabilityArea_mouse_entered():
	isAvailable = true 


func _on_AvailabilityArea_mouse_exited():
	isAvailable = false

func play_sound_effect():
	audio_stream_player.stream = saw_sound_effect
	audio_stream_player.play()
