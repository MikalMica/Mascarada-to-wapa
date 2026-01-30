extends GenericButton
signal HoldButtonON
signal HoldButtonOFF

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_player_enters_area)
	area_exited.connect(_player_exits_area)
	pass; # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;


func _player_enters_area(_area) -> void:
	#El botón se pulsa, manda una señal para avisar de que se ha pulsado y se reproduce la animación
	HoldButtonON.emit();
	$AnimatedSprite2D.frame = 1;


func _player_exits_area(_area) -> void:
	#El botón se pulsa, manda una señal para avisar de que se ha pulsado y se reproduce la animación
	HoldButtonOFF.emit();
	$AnimatedSprite2D.frame = 0;
