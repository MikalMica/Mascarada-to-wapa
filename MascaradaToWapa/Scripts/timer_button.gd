extends GenericButton
signal TimerButtonON
signal TimerButtonOFF
@export var isTimerOn = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_player_enters_area)
	pass; # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;


func _player_enters_area(_area) -> void:
	#El botón se pulsa, manda una señal para avisar de que se ha pulsado y se reproduce la animación
	if(isTimerOn == false):
		print_debug("timer")
		isTimerOn = true
		_activate_obstacles()
		TimerButtonON.emit();
		$AnimatedSprite2D.frame = 1;
		await get_tree().create_timer(1).timeout
		isTimerOn = false
		_deactivate_obstacles()
		TimerButtonOFF.emit();
		$AnimatedSprite2D.frame = 0;
	else:
		pass
