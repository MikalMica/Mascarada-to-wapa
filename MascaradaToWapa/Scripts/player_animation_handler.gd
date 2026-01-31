extends Node
class_name AnimationPLayer

@export var animation:AnimationPlayer
@export var player_sprite:Sprite2D
@export var player_rb:RigidBody2D

enum STATES {
	IDLE, MOVING
}

var current_state = STATES.IDLE

func _ready() -> void:
	enter_state(current_state)

func _process(delta: float) -> void:
	if player_rb.linear_velocity.x > 0:
		player_sprite.flip_h = true
	elif player_rb.linear_velocity.x < 0:
		player_sprite.flip_h = false
	
	var moving = player_rb.linear_velocity.length() > 0
	
	if current_state == STATES.IDLE:
		if moving:
			current_state = STATES.MOVING
			enter_state(current_state)
	elif current_state == STATES.MOVING:
		if not moving:
			current_state = STATES.IDLE
			enter_state(current_state)

func enter_state(new_state):
	if current_state == STATES.IDLE:
		animation.play(&"idle")
	elif current_state == STATES.MOVING:
		animation.play(&"walk_d")
