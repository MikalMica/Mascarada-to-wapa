extends Area2D

@export var player_parent_node:Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_enemy_hit)
	pass # Replace with function body.

func _on_enemy_hit(other):
	CheckpointHandler.instantiate_player_last_checkpoint()
	player_parent_node.queue_free()
	# deberia reiniciar la posicion del jugador a la posicion del ultimo checkpoint
