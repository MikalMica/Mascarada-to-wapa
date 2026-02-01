extends ColorRect
@export var time: float = 0.5
@export var iterations: int = 20
var mask_on: bool = false
var spread: float = 0.0

func _ready() -> void:
	SignalBus.connect("mask_timer_started", _mask_timer_running)
	SignalBus.connect("mask_timer_stopped", _mask_timer_stopped)

func _mask_timer_running() -> void:
	mask_on = true
	_mask_aberration()

func _mask_timer_stopped() -> void:
	mask_on = false
	spread = 0.0
	material.set("shader_parameter/spread", spread)

func _mask_aberration() -> void:
	for i in range(0, iterations):
		if !mask_on: pass
		spread += 0.05/iterations
		material.set("shader_parameter/spread", spread)
		await get_tree().create_timer(time/iterations).timeout
