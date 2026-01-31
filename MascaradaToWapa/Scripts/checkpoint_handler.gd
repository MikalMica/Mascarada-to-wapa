extends Node

@onready var player_scene: PackedScene = preload("res://Scenes/Objects/player_new.tscn")

var last_checkpoint_pos: Vector2

func instantiate_player_last_checkpoint():
	print("Player instantiated on last checkpint")
