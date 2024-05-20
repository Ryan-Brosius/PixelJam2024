extends Node2D


func _spawn_mob():
	var CRAB_ENTITY = preload("res://Nodes/Enemies/crab_entity_menu.tscn").instantiate()
	$Path2D/PathFollow2D.progress_ratio = randf()
	var random_place = Vector2(randi_range(-220, 220), 170)
	CRAB_ENTITY.global_position = $Path2D/PathFollow2D.global_position
	get_node("/root").add_child(CRAB_ENTITY)
	CRAB_ENTITY._targetPos = random_place


func _on_timer_timeout():
	_spawn_mob()
