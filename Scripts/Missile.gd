extends Node2D

@export var max_speed = 100.0
@export var drag = 0.15
@export var damage = 5

var _target
var _velocity = Vector2.ZERO

func _ready():
	_velocity = max_speed * Vector2.RIGHT.rotated(rotation)
	
func _process(delta):
	var direction = Vector2.RIGHT.rotated(rotation).normalized()
	
	if _target:
		if not is_instance_valid(_target):
			_target = null
		else:
			direction = global_position.direction_to(_target.global_position)
			
		
	var desired_velocity = direction * max_speed
	var prev_velocity = _velocity
	var change = (desired_velocity - prev_velocity) * drag
	
	_velocity += change
	
	position += _velocity * delta
	look_at(global_position + _velocity)

func _on_area_2d_body_entered(body):
	#select target
	if _target:
		return
	
	if body.is_in_group("enemy"):
		_target = body


func _on_collision_body_entered(body):
	#destroy target
	if body.is_in_group("enemy"):
		body.get_node("HealthComponent").damage(damage);
		
		_explode()

func _on_timer_timeout():
	_explode()
	
func _explode():
	var EXPLOSION = preload("res://Particles/explosion.tscn").instantiate()
	EXPLOSION.emitting = true
	EXPLOSION.global_position = global_position
	EXPLOSION.scale = Vector2(.3, .3)
	get_node("/root").add_child(EXPLOSION)
	queue_free()
