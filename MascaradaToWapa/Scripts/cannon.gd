extends Node2D

# dispara proyectiles en su up

@export var shooting_cd := 1.0
@export var projectile : PackedScene

func _ready() -> void:
	while(true):
		var p:Node2D = projectile.instantiate()
		p.shoot(Vector2.UP.rotated(rotation))
		add_child(p)
		p.global_rotation = 0.
		await get_tree().create_timer(shooting_cd).timeout
	
