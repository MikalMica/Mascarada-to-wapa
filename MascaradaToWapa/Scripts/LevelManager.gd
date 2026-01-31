extends Node

var currentLevel: int = 0

func getCurrentLevel() -> int:
	return currentLevel

func changeLevel(path: String) -> void:
	SceneManager.change_scene(path, {"pattern": "curtains", "color": Color(0.614, 0.096, 0.177, 1.0), "wait_time": 2, "invert_on_leave": false})
	currentLevel += 1

func changeLevel_call(path: String, on_ready: Callable) -> void:
	SceneManager.change_scene(path, {"pattern": "curtains", "color": Color(0.614, 0.096, 0.177, 1.0), "wait_time": 2, "on_ready": on_ready, "invert_on_leave": false})
	currentLevel += 1

func resetLevelToZero() -> void:
	currentLevel = 0

func resetLevelToZeroAndChangeScene(path: String) -> void:
	resetLevelToZero()
	SceneManager.change_scene(path, {"pattern": "curtains", "color": Color(0.614, 0.096, 0.177, 1.0), "wait_time": 2, "invert_on_leave": false})
