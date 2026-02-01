extends Sprite2D

@export var sprites :Array[Texture]

func _ready() -> void:
	var num:int = randi() % sprites.size()
	texture = sprites[num]
	AudioSystem._play_sound("Trumpet"+str(num))
