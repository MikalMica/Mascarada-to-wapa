extends Node2D
class_name SpriteHider

# Booleans to set with which masks will the object turn visible
@export var default: bool
@export var object: bool

func _ready() -> void:
	_turn_off()
	if default:
		SignalBus.connect("default_mask_on", _turn_on)
	if object:
		SignalBus.connect("object_mask_on", _turn_on)
	SignalBus.connect("mask_off", _turn_off)

func _turn_on() -> void:
	var children = get_children()
	for i in children:
		i.visible = true

func _turn_off() -> void:
	var children = get_children()
	for i in children:
		i.visible = false
