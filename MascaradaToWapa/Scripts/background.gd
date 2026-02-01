extends Sprite2D

@export_group("MASK_ON_COLORS")
@export var m_color_1: Color
@export var m_color_2: Color
@export var m_color_3: Color
@export var m_color_4: Color

@export_group("MASK_OFF_COLORS")
@export var o_color_1: Color
@export var o_color_2: Color
@export var o_color_3: Color
@export var o_color_4: Color

@export var tween_time := 0.35

var _tween: Tween

func _ready() -> void:
	if material:
		material = material.duplicate()

	on_mask_on()
	SignalBus.default_mask_on.connect(on_mask_on)
	SignalBus.mask_off.connect(on_mask_off)

func on_mask_on() -> void:
	_tween_shader_params({
		"colour1": m_color_1,
		"colour2": m_color_2,
		"colour3": m_color_3,
		"colour4": m_color_4,
		"gradual": 1.52,
		"width1": 0.21,
		"width2": 0.10,
		"scale1": 10.0,
		"scale2": 1.0,
		"intensity": 2.7,
		"spin_speed": 0.5,
		"spin_amount": 1.5,
	}, tween_time)

func on_mask_off() -> void:
	_tween_shader_params({
		"colour1": o_color_1,
		"colour2": o_color_2,
		"colour3": o_color_3,
		"colour4": o_color_4,
		"gradual": 1.52,
		"width1": 0.21,
		"width2": 0.10,
		"scale1": 10.0,
		"scale2": 1.0,
		"intensity": 1.8,
		"spin_speed": -0.3,
		"spin_amount": 1.0,
	}, tween_time)

func _tween_shader_params(target: Dictionary, duration: float) -> void:
	var mat := material as ShaderMaterial
	if mat == null:
		return

	if _tween and _tween.is_running():
		_tween.kill()

	_tween = create_tween()
	_tween.set_parallel(true)
	_tween.set_trans(Tween.TRANS_SINE)
	_tween.set_ease(Tween.EASE_IN_OUT)

	for param_name in target.keys():
		var to_val: Variant = target[param_name]
		var from_val: Variant = mat.get_shader_parameter(param_name)

		if from_val == null:
			mat.set_shader_parameter(param_name, to_val)
			continue

		var p := StringName(param_name)

		_tween.tween_method(
			func(v): mat.set_shader_parameter(p, v),
			from_val,
			to_val,
			duration
		)
