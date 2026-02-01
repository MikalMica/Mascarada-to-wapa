extends Area2D

@export var player_parent_node:Node2D
@onready var player_death:PackedScene = preload("res://Scenes/Objects/player_death.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_enemy_hit)
	pass # Replace with function body.

func _on_enemy_hit(other):
	var death = player_death.instantiate()
	player_parent_node.get_parent().add_child.call_deferred(death)
	player_parent_node.queue_free()
	# deberia reiniciar la posicion del jugador a la posicion del ultimo checkpoint
