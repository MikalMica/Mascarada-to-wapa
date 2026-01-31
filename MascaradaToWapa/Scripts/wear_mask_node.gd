extends Node2D
@export var playerRB: RigidBody2D
@export var timer:Timer

func _ready() -> void:
	timer.timeout.connect(on_timer_timeout)
# Called every frame. 'delta' is the elapsed time since the previous frame.
var hasStopped:bool = false
var maskIsOn:bool = false

func _process(delta: float) -> void:
	if playerRB.linear_velocity == Vector2.ZERO && !hasStopped:
		hasStopped = true
		timer.start(timer.wait_time)
		
	if playerRB.linear_velocity != Vector2.ZERO:
		hasStopped = false
		timer.stop()
		if(maskIsOn): 
			maskIsOn = false
			SignalBus.mask_off.emit()
		
func on_timer_timeout():
	if !hasStopped: pass
	maskIsOn = true
	SignalBus.default_mask_on.emit()
	#wear mask
