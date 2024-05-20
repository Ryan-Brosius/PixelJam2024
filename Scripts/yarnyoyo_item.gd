extends Node2D

var enemiesNear = []
const YARN = preload("res://Nodes/Items/yarn.tscn")

func throw():
	if enemiesNear.size() == 0:
		return
	
	var currentEnemy = null
	var currentRange = 999
	
	for i in range(enemiesNear.size()):
		if not is_instance_valid(enemiesNear[i]):
			enemiesNear[i].remove_at(i)
			i-=1
		if (enemiesNear[i].global_position - global_position).length() < currentRange:
			currentRange = (enemiesNear[i].global_position - global_position).length()
			currentEnemy = enemiesNear[i]
			
	var obj = YARN.instantiate()
	obj._target = currentEnemy
	obj.global_position = global_position
	get_node("/root").add_child(obj)

func _on_area_2d_2_body_entered(body):
	if body.is_in_group("enemy"):
		enemiesNear.append(body)

func _on_area_2d_2_body_exited(body):
	if body.is_in_group("enemy"):
		for i in range(enemiesNear.size()):
			if enemiesNear[i] == body:
				enemiesNear.remove_at(i)
				break;


func _on_timer_timeout():
	throw()
