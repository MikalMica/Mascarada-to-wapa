extends Control
@export var iniMenu:VBoxContainer
@export var settingsMenu:MarginContainer

func toggle_visibility(object)->void:
	object.visible = !object.visible


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Level_1.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_settings_pressed() -> void:
	toggle_visibility(iniMenu)
	toggle_visibility(settingsMenu)


func _on_settings_exit_pressed() -> void:
	toggle_visibility(iniMenu)
	toggle_visibility(settingsMenu)


func _on_h_slider_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.


func _on_h_slider_2_drag_ended(value_changed: bool) -> void:
	pass # Replace with function body.
