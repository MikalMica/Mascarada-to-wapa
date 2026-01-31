extends Button
@export var audioSys : Audio_System
@export var sound : AudioStream
@export var sound2 : AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_down() -> void:
	audioSys._change_main_theme(audioSys.MAIN_THEME.PAUSE)
