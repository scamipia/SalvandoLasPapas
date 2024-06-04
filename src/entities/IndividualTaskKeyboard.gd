extends IndividualTask
class_name IndividualTaskKeyboard
signal done
signal release
onready var sprite = $Sprite
onready var label = $Sprite/Label
onready var audio_stream_player = $AudioStreamPlayer

var disable = false
var steps: int

export (AudioStream) var saw_sound_effect


func setup(resource: IndividualTaskResource) -> void:
	steps = resource.clicks_amount
	position = resource.task_pos
		
func _ready():
	label.text = str(steps)

func work():
	#if steps > 1:
	#	steps -= 1
	#	label.text = str(steps)
		play_sound_effect()
	#else:
		completeTask() 
		

func completeTask():
	print("done job")
	emit_signal("done")
	#queue_free()
	visible = false

func play_sound_effect():
	audio_stream_player.stream = saw_sound_effect
	audio_stream_player.play()

func release(positionPlayer: Vector2):
	pass
