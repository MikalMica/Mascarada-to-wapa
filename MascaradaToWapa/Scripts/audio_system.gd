extends Node2D
class_name Audio_System


@export var tracks : Array[AudioStream]
@export var _music : AudioStreamPlayer
@export var _sfx : Node2D

@export var _music_volume := 8.0
@export var _sfx_volume := 8.0


enum SONG {
	MAIN_THEME,
	XILOFONO,
}

enum MAIN_THEME{
	UNMASK,
	MASK,
	PAUSE,
}

func _ready() -> void:
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
			_music.stream.set_sync_stream_volume(MAIN_THEME.UNMASK, 0)
		elif theme == MAIN_THEME.UNMASK:
			_music.stream.set_sync_stream_volume(MAIN_THEME.MASK, 0)
		elif theme == MAIN_THEME.PAUSE:
			_music.stream.set_sync_stream_volume(MAIN_THEME.PAUSE, 0)

func _change_sfx_volume(volume: float):
	for audioSP in _sfx.get_children():
		audioSP.volume_linear = _sfx_volume

func _change_volume_volume(volume: float):
	_music.volume_linear = _music_volume
