extends Node2D

@export var MIN_FORCE:float
@export var MAX_FORCE:float

@export var hatRB : RigidBody2D
@export var headRB : RigidBody2D
@export var torsoRB : RigidBody2D
@export var ribbonRB : RigidBody2D
@export var timer:Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	applyRandomForce(hatRB)
	applyRandomForce(headRB)
	applyRandomForce(torsoRB)
	applyRandomForce(ribbonRB)
	timer.start()
	timer.timeout.connect(reset_player)
	pass # Replace with function body.

func applyRandomForce(body:RigidBody2D):
	var randomAngle:float = randf_range(0, 360) * PI / 180.
	
	var randomDir:Vector2 = Vector2(sin(randomAngle), cos(randomAngle))
	var randomForce = randf_range(MIN_FORCE, MAX_FORCE)
	
	body.apply_force(randomDir*randomForce)

func reset_player():
	
	CheckpointHandler.instantiate_player_last_checkpoint()
	queue_free()
