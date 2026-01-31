extends RigidBody2D

@export var speed := 5.0

func _ready() -> void:
	body_entered.connect(papearse)

func papearse(_o):
	queue_free()

func shoot(dir :Vector2) -> void:
	linear_velocity = dir * speed
