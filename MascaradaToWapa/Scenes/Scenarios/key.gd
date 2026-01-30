extends RigidBody2D

@export var doorObject : Node2D

func _on_collision(body: Node) -> void:
	if(body is Node2D && body == doorObject): 
		doorObject.open()
