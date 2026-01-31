extends Node
@export var movementNode : Character
var disconnected:bool

func _ready() -> void:
	SignalBus.deactivate_input.connect(func(): 
		movementNode.stop()
		disconnected = true)

func _input(event: InputEvent) -> void:
	if disconnected: return
	if !event.is_pressed():
		movementNode.stop()
		
	var dir := Vector2(0, 0)
	var x_axis:float = Input.get_axis("Left", "Right")
	var y_axis:float = Input.get_axis("Up", "Down")
	
	movementNode.move(Vector2(x_axis, y_axis))
