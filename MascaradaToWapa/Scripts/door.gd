extends Obstacle
class_name Door
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _activate() -> void:
	_open()
	
func _deactivate() -> void:
	_close()

func _close()-> void:
	#Cambia sprite y activa el collider
	$CollisionShape2D.set_deferred("disabled", false)
	$AnimatedSprite2D.frame = 0

func _open()-> void:
	#Cambia sprite y desactiva el collider
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D.frame = 1
