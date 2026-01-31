extends Node2D
class_name Audio_System


@export var tracks : Array[AudioStream]
@export var _music : AudioStreamPlayer2D

@export var _sfx : Node2D
@export var _free_sfx_players : Array[AudioStreamPlayer2D]

@export var _sfx_limit := 10

enum SONG {
	MAIN_THEME,
}

func _ready() -> void:
#	_create_players()
	pass

func _play_song(songID : SONG):
	_music.stream = tracks[songID]
	_music.play(.0)
	
func _play_sound(sound : AudioStream):
	var freePlayer : AudioStreamPlayer2D = _free_sfx_players.pop_back()
	freePlayer.stream = sound
	freePlayer.play(.0)
	freePlayer.finished.connect(func() -> void: 
		_free_sfx_players.push_back(freePlayer)
	)
	
func _create_players() -> void:
	for i in _sfx_limit:
		var child = AudioStreamPlayer2D.new()
		_sfx.add_child(child)
		_free_sfx_players.push_back(child)
