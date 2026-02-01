extends Node
@export var settings : Control
@onready var musicVol = $PauseMenu/Control/Music
@onready var sfxVol = $PauseMenu/Control/SFX


func _ready() -> void:
	print_debug(AudioSystem._get_music_volume())
	musicVol.set_value_no_signal(AudioSystem._get_music_volume())
	sfxVol.set_value_no_signal(AudioSystem._get_sfx_volume())
# No funciona for some fucking reason
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		_continue_pressed()

func _continue_pressed() -> void:
	AudioSystem._change_main_theme(AudioSystem.MAIN_THEME.UNMASK)
	get_tree().paused = false
	get_tree().root.remove_child(self)

func _main_menu_pressed() -> void:
	get_tree().paused = false
	LevelManager.resetLevelToZeroAndChangeScene("res://Scenes/Scenarios/Interfaz.tscn")
	await get_tree().create_timer(1.0).timeout
	get_tree().root.remove_child(self)


func _on_settings_pressed() -> void:
	settings.visible = true
	


func _on_settings_exit_pressed() -> void:
	settings.visible = false


func _on_music_drag_ended(value_changed: bool) -> void:
	AudioSystem._change_music_volume(musicVol.value)


func _on_sfx_drag_ended(value_changed: bool) -> void:
	AudioSystem._change_sfx_volume(sfxVol.value)
