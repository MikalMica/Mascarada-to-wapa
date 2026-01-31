extends draggable

@export var doorObject : Node2D
@onready var area: Area2D = $Area2D


func _ready() -> void:
	area.area_entered.connect(_door_enters_area)
	pass; # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;


func _door_enters_area(_area) -> void:
	#El botón se pulsa, manda una señal para avisar de que se ha pulsado y se reproduce la animación
	var parent = _area.get_parent()
	if(parent is Door):
		parent._activate()
		_delete()
		
	else:
		pass
func _delete()->void:
	queue_free()
