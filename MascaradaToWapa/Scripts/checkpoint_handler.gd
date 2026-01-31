extends Node

@onready var player_scene: PackedScene = preload("res://Scenes/Objects/player_new.tscn")

var last_checkpoint_pos: Vector2 = Vector2.ZERO

func instantiate_player_last_checkpoint():
	var player:Node2D = player_scene.instantiate()
	var current_level = get_tree().get_first_node_in_group(&"Level")
	current_level.add_child(player)
	player.position = last_checkpoint_pos
	print("Player instantiated on last checkpint")
	

func set_last_position(last_pos: Vector2) -> void:
	last_checkpoint_pos = last_pos
