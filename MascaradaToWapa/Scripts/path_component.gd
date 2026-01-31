extends Node2D
class_name PathComponent

@export var movement_component:Character
@export var pathPoints : Array[Vector2]

var i = 0

func _pointReached() -> bool:
	return position.distance_to(pathPoints[i]) < 0.5
	
func _moveTowards() -> void:
	if(_pointReached()):
		++i
		movement_component.move(pathPoints[i])
		print("Moving towards position ", pathPoints[i])
		
