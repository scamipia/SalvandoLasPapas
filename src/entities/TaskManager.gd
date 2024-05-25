extends Node

signal task_completed
signal all_tasks_completed

export (Resource) var task_stack_resource 

var current_step: int = 0
var active_task: IndividualTask

func _ready():
	if task_stack_resource:
		start_tasks()

func set_task_stack_resource(resource: TaskStackResource):
	task_stack_resource = resource
	if is_inside_tree():
		start_tasks()
		

func start_tasks():
	change_active_task(current_step)

func change_active_task(new_step: int) -> void:
	print("Changing active task to step: ", new_step)
	if active_task:
		print("Removing current active task")
		remove_child(active_task)
		active_task.queue_free()
	current_step = new_step
	active_task = task_stack_resource.get_next_task(current_step)
	if active_task:
		print("New task added: ", active_task)
		active_task.connect("done", self, "_on_task_done")
		add_child(active_task)
		# Inicializa la tarea
		active_task.resetSteps()
		active_task.resetWorker()
	else:
		print("No task available for step: ", new_step)

func _on_task_done():
	emit_signal("task_completed")
	current_step += 1
	if current_step < task_stack_resource.tasks_amount():
		change_active_task(current_step)
	else:
		emit_signal("all_tasks_completed")
