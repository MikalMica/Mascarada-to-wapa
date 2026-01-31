extends Node


func _continue_pressed() -> void:
	get_tree().paused = false
	get_tree().root.remove_child(self)

func _main_menu_pressed() -> void:
	# ESTO NO FUNCIONA TODAVIAAAAAAAA
	LevelManager.resetLevelToZeroAndChangeScene("HOLA")
