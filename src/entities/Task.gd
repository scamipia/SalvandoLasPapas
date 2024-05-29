extends Node

class_name Task
var current_step: int = 0
var task_data: TaskStackResource    #(stack)
var active_task: IndividualTask    #(step)

func _ready():
	print("ready")
	#resetSteps()
	#resetWorker()

func setup(p_task_data: TaskStackResource) -> void:
	task_data = p_task_data
	
	change_active_task(task_data.get_next_task())

func change_active_task(task : Node) -> void:
	if active_task != null:
		remove_child(active_task)
		active_task.queue_free()
	
	active_task = new_task
	add_child(active_task)
