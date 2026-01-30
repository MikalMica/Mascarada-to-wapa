extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_enemy_hit)
	pass # Replace with function body.

func _on_enemy_hit(other):
	print("Me duele")
