extends RigidBody2D
class_name Character

@export var maxSpeed := 500.0
@export var force := 500.0

var _dir = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	apply_force(_dir * force *delta)
	#if linear_velocity.length() > maxSpeed:
	if linear_velocity.length() < 15: linear_velocity = Vector2.ZERO
	

func move(direction: Vector2) -> void:
	_dir = direction
	#_dir = _dir.normalized()
	
func stop() -> void:
	linear_velocity = Vector2.ZERO
	_dir = Vector2.ZERO
