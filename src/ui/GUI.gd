extends Control
signal timeout

onready var remaining_time_label = $RemainingTime
var default_time = 30
var remaining_time = 30

func _ready():
	restart()

func restart():
	remaining_time = default_time
	remaining_time_label.text = str(remaining_time)
	
func update_score(score):
	remaining_time -= score
	remaining_time_label.text = str(remaining_time)
	if(remaining_time == 0):
		emit_signal("timeout")
