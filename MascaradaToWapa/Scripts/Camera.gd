extends Camera2D
class_name Camera

var INIT_ZOOM:Vector2 = Vector2(1,1)
const INIT_OFFSET:Vector2 = Vector2.ZERO

var cur_zoom:Vector2 = INIT_ZOOM
var cur_offset:Vector2 = INIT_OFFSET

var shake_recov_factor:float = 1.0
var zoom_recov_factor:float = 2.0

@export var _follow:bool = false
@export var vertical_margin:float = 80.0
@export var follow_speed:float = 5.0

@export var GROUP_NAME:StringName = &"player"

@onready var target:Node2D = get_tree().get_first_node_in_group(GROUP_NAME)


func _ready():
	INIT_ZOOM = zoom
	offset = INIT_OFFSET
	
	SceneManager.fade_complete.connect(func(): 
		_follow = true
		target = get_tree().get_first_node_in_group(GROUP_NAME))
		
	make_current()

func _process(delta: float) -> void:
	follow_target(delta)
	recover_zoom(delta)
	recover_offset_and_shake(delta)


func follow_target(delta: float) -> void:
	if target == null:
		target = get_tree().get_first_node_in_group(GROUP_NAME)
		return
	
	if not _follow:
		return
	
	var target_pos: Vector2 = target.global_position
	
	global_position.x = target_pos.x
	
	var cam_y := global_position.y
	var top_limit := cam_y - vertical_margin
	var bottom_limit := cam_y + vertical_margin
	
	var desired_y := cam_y
	
	if target_pos.y < top_limit:
		desired_y = target_pos.y + vertical_margin
	elif target_pos.y > bottom_limit:
		desired_y = target_pos.y - vertical_margin
	
	global_position.y = lerp(cam_y, desired_y, follow_speed * delta)


func recover_offset_and_shake(delta:float) -> void:
	cur_offset = lerp(cur_offset, INIT_OFFSET, delta * shake_recov_factor)
	cur_offset.x = randf_range(cur_offset.x * -1.0, cur_offset.x * 1.0)
	cur_offset.y = randf_range(cur_offset.y * -1.0, cur_offset.y * 1.0)
	offset = cur_offset


func recover_zoom(delta:float) -> void:
	cur_zoom = lerp(cur_zoom, INIT_ZOOM, zoom_recov_factor * delta)
	zoom = cur_zoom


func set_zoom_str(zoom_str:float) -> void:
	cur_zoom *= zoom_str


func set_shake_str(shake_val:Vector2) -> void:
	cur_offset += shake_val


func shake_camera(zoom_str:float, shake_val:Vector2) -> void:
	set_zoom_str(zoom_str)
	set_shake_str(shake_val)
