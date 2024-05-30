extends Node

class_name Task

signal complete

var current_step: int = 0
var task_data: TaskStackResource    #(stack)
var active_task: Node    #(step)

export (String) var stackRoute: String 
onready var task_stack_resource = load(stackRoute) as TaskStackResource

func _ready():
	print("ready")


func setup() -> void:
	task_data = task_stack_resource
	change_active_task(task_data.get_next_task())

func change_active_task(task : Node) -> void:
	if task != null:
		
		if active_task != null:
			remove_child(active_task)
			active_task.queue_free()
		
		active_task = task
		active_task.connect("done", self, "_on_task_done")
		add_child(active_task)
	
	else:
		emit_signal("complete")

func _on_task_done():
	print("done")
	change_active_task(task_data.get_next_task())
