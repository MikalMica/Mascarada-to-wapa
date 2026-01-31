extends RigidBody2D
class_name draggable
@export var friction = 0.1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var frictionForce = -linear_velocity*friction
	apply_central_impulse(frictionForce)
