extends Area2D

@export var path: String

# Only player should collide with this since is the only object with collision layer 8
func _on_body_entered(body: Node2D) -> void:
	LevelManager.changeLevel(path)
