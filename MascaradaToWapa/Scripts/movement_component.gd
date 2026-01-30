extends CharacterBody2D
class_name Character

@export var speed := 2000.0
var _dir = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = _dir * speed * delta;
	move_and_slide()

func move(direction: Vector2) -> void:
	_dir = direction.normalized()
