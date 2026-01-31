extends Area2D

@export var player_node: RigidBody2D
var last_checkpoint_node: LastCheckpointPosition
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_enemy_hit)
	pass # Replace with function body.

func _on_enemy_hit(other):
	last_checkpoint_node = get_tree().get_first_node_in_group(&"checkpoint")
	player_node.position = last_checkpoint_node.checkpoint_pos
	# deberia reiniciar la posicion del jugador a la posicion del ultimo checkpoint
