extends Node2D

const MISSILE = preload("res://Nodes/Items/missile.tscn")

func spawn_missiles():
	for i in range(3):
		var m = MISSILE.instantiate()
		m.global_position = global_position
		m.rotation = randf_range(0, 360);
		get_node("/root").add_child(m)

func _on_timer_timeout():
	spawn_missiles()
