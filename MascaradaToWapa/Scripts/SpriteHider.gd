extends Node2D
class_name SpriteHider

# Booleans to set with which masks will the object turn visible
@export var default: bool
@export var object: bool

var TWEEN_TIME = .1

var tween:Tween

func _ready() -> void:
	tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	_turn_off()
	if default:
		SignalBus.connect("default_mask_on", _turn_on)
	if object:
		SignalBus.connect("object_mask_on", _turn_on)
	SignalBus.connect("mask_off", _turn_off)

func _turn_on() -> void:
	tween.kill()
	tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, TWEEN_TIME)

func _turn_off() -> void:
	tween.kill()
	tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, TWEEN_TIME)
