extends Obstacle
class_name Door
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _activate() -> void:
	#Cambia sprite y desactiva el collider
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.speed_scale = 1
	$AnimationPlayer.play("open")
	
func _deactivate() -> void:
	#Cambia sprite y activa el collidere
	$CollisionShape2D.set_deferred("disabled", false)
	$AnimationPlayer.speed_scale = -1
	$AnimationPlayer.play("open")
