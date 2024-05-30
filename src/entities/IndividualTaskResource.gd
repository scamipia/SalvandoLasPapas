extends Resource

class_name IndividualTaskResource

export (int) var clicks_amount: int
export (int) var player_type: int
export (Vector2) var task_pos: Vector2

export (PackedScene) var individual_task_scene: PackedScene

func get_task() -> Node:
	var task_instance = individual_task_scene.instance()
	task_instance.setup(self)
	return task_instance
	
