extends Sprite2D

@export var skins: Array[Texture2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rnd = randi_range(0, skins.size()-1)
	texture = skins[rnd]
