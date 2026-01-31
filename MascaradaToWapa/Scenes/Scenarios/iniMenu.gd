extends Control
@export var iniMenu:VBoxContainer
@export var settingsMenu:MarginContainer

func toggle_visibility(object)->void:
	object.visible = !object.visible


func _on_play_pressed() -> void:
	print_debug("a")
	get_tree().change_scene_to_file("res://Scenes/Levels/Level_1.tscn")

func _on_exit_pressed() -> void:
	print_debug("b")
	get_tree().quit()

func _on_settings_pressed() -> void:
	print_debug("c")
	toggle_visibility(iniMenu)
	toggle_visibility(settingsMenu)
