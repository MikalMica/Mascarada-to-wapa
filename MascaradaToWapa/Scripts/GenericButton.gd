extends Area2D
class_name GenericButton
@export var TriggeredObstacle : Array[Obstacle]

	# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _activate_obstacles() -> void:
	for obstacle in TriggeredObstacle:
		obstacle._activate()

func _deactivate_obstacles() -> void:
	for obstacle in TriggeredObstacle:
		obstacle._deactivate()
