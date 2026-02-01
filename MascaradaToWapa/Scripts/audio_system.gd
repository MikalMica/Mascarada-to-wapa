extends Node2D
class_name Audio_System


@export var tracks : Array[AudioStream]
@export var _music : AudioStreamPlayer
@export var _sfx : Node2D

@export var _music_volume := 8.0
@export var _sfx_volume := 8.0


enum SONG {
	MENU_THEME,
	MAIN_THEME,
}

enum MAIN_THEME{
	UNMASK,
	MASK,
	PAUSE,
}

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_music.stream = tracks[SONG.MAIN_THEME]
	_change_main_theme(MAIN_THEME.UNMASK)
	_music.play()
	for audioSP in _sfx.get_children():
		audioSP.volume_linear = _sfx_volume
	_music.volume_linear = _music_volume

func _play_song(songID : SONG):
	_music.stream = tracks[songID]
	if songID == SONG.MAIN_THEME:
		_change_main_theme(MAIN_THEME.UNMASK)
	_music.play(.0)

func _play_sound(soundEffect : String):
	var audioPlayer = _sfx.get_node(soundEffect)
	audioPlayer.play()

func _change_main_theme(theme: MAIN_THEME) -> void:
	
	if _music.stream is AudioStreamSynchronized:
		for i in range(0,3):
			_music.stream.set_sync_stream_volume(i, -60)
		if theme == MAIN_THEME.MASK:
			_music.stream.set_sync_stream_volume(MAIN_THEME.MASK, 0)
		elif theme == MAIN_THEME.UNMASK:
			_music.stream.set_sync_stream_volume(MAIN_THEME.UNMASK, -2)
		elif theme == MAIN_THEME.PAUSE:
			_music.stream.set_sync_stream_volume(MAIN_THEME.PAUSE, 0)

func _change_sfx_volume(volume: float):
	_sfx_volume = volume
	for audioSP in _sfx.get_children():
		audioSP.volume_linear = volume

func _change_music_volume(volume: float):
	_music_volume = volume
	_music.volume_linear = volume
	
func _get_music_volume() -> float:
	return _music_volume

func _get_sfx_volume() -> float:
	return _sfx_volume
