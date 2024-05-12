tool
extends Node

onready var input = $HBoxContainer/Panel/Input
onready var action = $HBoxContainer/Action

export (StreamTexture) var action_input: StreamTexture setget _set_action_input
export (String) var action_name: String setget _set_action_name

func _ready() -> void:
	input.texture = action_input
	action.text = action_name

func _set_action_input (inp: StreamTexture) -> void:
	action_input = inp
	
		
func _set_action_name (nm: String) -> void:
	action_name = nm
	if Engine.editor_hint && has_node("%Action"):
		$"%Action".text = nm
