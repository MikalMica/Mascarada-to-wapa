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
		SignalBus.mask_timer_started.emit()
		AudioSystem._change_main_theme(AudioSystem.MAIN_THEME.MASK)
		
	if playerRB.linear_velocity != Vector2.ZERO:
		hasStopped = false
		timer.stop()
		SignalBus.mask_timer_stopped.emit()
		if(maskIsOn): 
			maskIsOn = false
			SignalBus.mask_off.emit()
			AudioSystem._change_main_theme(AudioSystem.MAIN_THEME.UNMASK)
		
		
func on_timer_timeout():
	if !hasStopped: pass
	maskIsOn = true
	SignalBus.default_mask_on.emit()
	#wear mask
