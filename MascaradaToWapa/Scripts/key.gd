extends draggable

@export var doorObject : Node2D
@export var area:Area2D

func _ready() -> void:
	area.area_entered.connect(_door_enters_area)
	pass; # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;


func _door_enters_area(_area) -> void:
	#El botón se pulsa, manda una señal para avisar de que se ha pulsado y se reproduce la animación
	if(_area.get_parent() is Door):
		_area.get_parent()._activate()
	else:
		pass
