extends GenericButton
signal HoldButtonON
signal HoldButtonOFF

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame = 0;
	body_entered.connect(_player_enters_area)
	body_exited.connect(_player_exits_area)
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;


func _player_enters_area(_area) -> void:
	#El botón se pulsa, manda una señal para avisar de que se ha pulsado y se reproduce la animación
	print_debug("hold")
	_activate_obstacles()
	HoldButtonON.emit();
	$AnimatedSprite2D.frame = 1;
	AudioSystem._play_sound("Button")


func _player_exits_area(_area) -> void:
	#El botón se pulsa, manda una señal para avisar de que se ha pulsado y se reproduce la animación
	_deactivate_obstacles()
	HoldButtonOFF.emit();
	$AnimatedSprite2D.frame = 0;
