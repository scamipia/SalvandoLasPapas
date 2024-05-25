extends Resource
class_name TaskStackResource

#export (Array, Resource) var individual_tasks: Array
#export (int) var clicks_amount: int
#export (int) var player_type: int
export (Array, PackedScene) var individual_tasks: Array

#var current_step: int = 0
#var active_task: IndividualTask

func get_next_task(step: int) -> Node:
	if step >= 0 && step < individual_tasks.size():
		return individual_tasks[step].instance()
	return null
	
#func get_task() -> Node:
#	var task_instance = individual_task_scene.instance()
#	task_instance.setup(self)
#	return task_instance

func tasks_amount() -> int:
	return individual_tasks.size()
