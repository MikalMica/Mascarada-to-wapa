extends GPUParticles2D
@export var movement:Character

func _process(delta: float) -> void:
	if movement.linear_velocity.length() > 0:
		emitting = true
	else:
		emitting = false
