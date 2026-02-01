extends Control
@export var iniMenu:Control
@export var settingsMenu:Control
@onready var musicVol = $Menu/SettingsContainer/MarginContainer2/VBoxContainer/Music
@onready var sfxVol = $Menu/SettingsContainer/MarginContainer2/VBoxContainer/SFX

func _ready() -> void:
	AudioSystem._play_song(AudioSystem.SONG.MAIN_THEME) #A futuro, cambiar por el nombre de la canción de menú

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

func _on_music_drag_ended(value_changed: bool) -> void:
	AudioSystem._change_music_volume(musicVol.value)

func _on_sfx_drag_ended(value_changed: bool) -> void:
	AudioSystem._change_sfx_volume(sfxVol.value)
