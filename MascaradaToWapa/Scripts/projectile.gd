extends RigidBody2D

@export var speed := 5.0

func shoot(dir :Vector2) -> void:
	linear_velocity = dir * speed
	
