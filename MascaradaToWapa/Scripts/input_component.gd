extends Node
@export var movementNode:Character

func _input(event: InputEvent) -> void:
	if !event.is_pressed():
		movementNode.move(Vector2(0, 0))
		
	var dir := Vector2(0, 0)
	var x_axis:float = Input.get_axis("Left", "Right")
	var y_axis:float = Input.get_axis("Up", "Down")
	
	movementNode.move(Vector2(x_axis, y_axis))
