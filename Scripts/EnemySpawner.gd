extends Node2D

var totalTime = 0

func _ready():
	pass

func _process(delta):
	totalTime += delta

func _spawn_mob():
	var CRAB_ENTITY = preload("res://Nodes/Enemies/crab_entity.tscn").instantiate()
	$Path2D/PathFollow2D.progress_ratio = randf()
	CRAB_ENTITY.global_position = $Path2D/PathFollow2D.global_position
	get_node("/root").add_child(CRAB_ENTITY)
	CRAB_ENTITY.get_node("HealthComponent").maxHealth += exp(0.01 * totalTime)
	CRAB_ENTITY.get_node("HealthComponent").damage(-9999)
	CRAB_ENTITY.get_node("MoveComponent").MaxSpeed += exp(0.005 * totalTime)


func _on_timer_timeout():
	global_position = $"../Player".global_position
	_spawn_mob()
