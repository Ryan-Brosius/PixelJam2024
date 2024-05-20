extends Node2D

@export var max_speed = 300
@export var drag = .15
@export var damage = 10;
@export var range = 1500;
@export var first_hit = false
@onready var player = get_node('/root/Scene/Player');

var _target = null
var _velocity = Vector2.ZERO
var direction
var _can_destroy = false

func _ready():
	if _target:
		if not is_instance_valid(_target):
			_target = null
		else:
			direction = (_target.global_position - global_position).normalized()

func _process(delta):
	rotate(25 * delta)
	
	if _can_destroy:
		if (player.global_position - global_position).length() < 1:
			queue_free()
	
	if not first_hit and is_instance_valid(_target):
		direction = global_position.direction_to(_target.global_position)
	else:
		direction = global_position.direction_to(player.global_position)
		_can_destroy = true
		
	var desired_velocity = direction * max_speed
	var prev_velocity = _velocity
	var change = (desired_velocity - prev_velocity) * drag
	_velocity += change
	position += _velocity * delta
	

func _on_area_2d_body_entered(body):
	if not first_hit && body.is_in_group("enemy"):
		body.get_node("HealthComponent").damage(damage);
		first_hit = true
		_can_destroy = true
		
