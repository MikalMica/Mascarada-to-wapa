extends Area2D
class_name ChangeLevelOnTrigger

@export var levelID: int

func _ready() -> void:
	area_entered.connect(on_enter)

# Only player should collide with this since is the only object with collision layer 8
func on_enter(body: Node2D) -> void:
	if levelID == 0:
		LevelManager.resetLevelToZeroAndChangeScene("res://Scenes/Scenarios/VictoryScene.tscn")
		return
	var path = "res://Scenes/Levels/Level_" + str(levelID) + ".tscn"
	LevelManager.changeLevel(path)
	SignalBus.deactivate_input.emit()
