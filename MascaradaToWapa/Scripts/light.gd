extends Obstacle
class_name Light

var off: Color = Color(1.0, 0.0, 0.0, 1.0)
var on: Color = Color(0.0, 0.649, 0.1, 1.0)
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.modulate = off

func _activate() -> void:
	sprite.modulate = on

func _deactivate() -> void:
	sprite.modulate = off
