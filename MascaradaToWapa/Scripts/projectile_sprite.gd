extends Sprite2D

@export var sprites :Array[Texture]

func _ready() -> void:
	texture = sprites[randi() % sprites.size()]
