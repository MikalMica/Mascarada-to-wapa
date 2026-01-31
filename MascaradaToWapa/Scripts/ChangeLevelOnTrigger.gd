extends Area2D

@export var levelID: int

# Only player should collide with this since is the only object with collision layer 8
func _on_body_entered(body: Node2D) -> void:
	var path = "res://Scenes/Scenarios/Level_" + str(levelID) + ".tscn"
	LevelManager.changeLevel(path)
