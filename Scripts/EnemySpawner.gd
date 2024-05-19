extends Node2D

func _ready():
	pass

func _spawn_mob():
	var CRAB_ENTITY = preload("res://Nodes/Enemies/crab_entity.tscn").instantiate()
	$Path2D/PathFollow2D.progress_ratio = randf()
	CRAB_ENTITY.global_position = $Path2D/PathFollow2D.global_position
	get_node("/root").add_child(CRAB_ENTITY)


func _on_timer_timeout():
	global_position = $"../Player".global_position
	_spawn_mob()
