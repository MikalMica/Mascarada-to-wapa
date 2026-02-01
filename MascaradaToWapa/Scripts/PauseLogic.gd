extends Node

# No funciona for some fucking reason
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		_continue_pressed()

func _continue_pressed() -> void:
	get_tree().paused = false
	get_tree().root.remove_child(self)

func _main_menu_pressed() -> void:
	get_tree().paused = false
	LevelManager.resetLevelToZeroAndChangeScene("res://Scenes/Scenarios/Interfaz.tscn")
	await get_tree().create_timer(1.0).timeout
	get_tree().root.remove_child(self)
