extends CharacterBody2D
class_name CharacterB

@export var force := 2500.0
@export var maxSpeed := 150.0

var _dir = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if velocity.length() > maxSpeed:
		velocity = _dir * maxSpeed
	
	move_and_slide()

func move(direction: Vector2) -> void:
	_dir += direction
	_dir = _dir.normalized()
	
func stop() -> void:
	velocity = Vector2.ZERO
	_dir = Vector2.ZERO
