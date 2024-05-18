extends Node2D

@onready var player = $".."
@export var max_position_away = 10

func _process(delta):
	point_towards_mouse();
	
func point_towards_mouse():
	var pos = get_global_mouse_position() - player.position
	var rot = player.global_position.angle_to_point(global_position)
	
	if pos.length() > max_position_away:
		position = pos.normalized() * max_position_away
	else:
		position = pos

	rotation = rot

func shoot():
	$RayCast2D.is_casting = true
