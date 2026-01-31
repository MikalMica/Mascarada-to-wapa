extends Node
class_name MaskHandler

# to add a mask add an id to masks and the signal from the SignalBus
# written as a String to maskSignals. BOTH OF THEM IN ORDER
enum masks {NONE, DEFAULT, OBJECT}
var maskSignals = ["ERROR", "default_mask_on", "object_mask_on"]
var mask = masks.NONE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("default_mask"):
		mask_change(masks.DEFAULT)
	elif event.is_action_pressed("object_mask"):
		mask_change(masks.OBJECT)

func mask_change(nMask: masks) -> void:
	SignalBus.emit_signal("mask_off")
	if mask != nMask:
		SignalBus.emit_signal(maskSignals[nMask])
		mask = nMask
	else: mask = masks.NONE
