extends Node
@export var movementNode : Character
var disconnected:bool
var pause = preload("res://Scenes/Levels/pause_menu.tscn")

func _ready() -> void:
	SignalBus.deactivate_input.connect(func(): 
		movementNode.stop()
		disconnected = true)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		get_tree().root.add_child(pause.instantiate())
		get_tree().paused = true
		AudioSystem._change_main_theme(AudioSystem.MAIN_THEME.PAUSE)
		return
	if disconnected: return
		
	var dir := Vector2(0, 0)
	var x_axis:float = Input.get_axis("Left", "Right")
	var y_axis:float = Input.get_axis("Up", "Down")
	
	movementNode.move(Vector2(x_axis, y_axis).normalized())
