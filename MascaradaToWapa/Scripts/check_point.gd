extends Node2D
@export var checkpointArea:Area2D

var used:bool = false

func _ready() -> void:
	checkpointArea.area_entered.connect(checkpointFunctionality)
	
func checkpointFunctionality(other):
	if used: pass
	
	CheckpointHandler.set_last_position(position)
	print("Updated sheckpoint")
	used = true
