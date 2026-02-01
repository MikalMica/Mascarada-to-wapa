extends Node


func _main_menu() -> void:
	LevelManager.resetLevelToZeroAndChangeScene("res://Scenes/Scenarios/Interfaz.tscn")

func _play() -> void:
	LevelManager.resetLevelToZero()
	LevelManager.changeLevel("res://Scenes/Levels/Level_1.tscn")
