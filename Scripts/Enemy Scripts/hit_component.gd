extends Node2D

@export var death_animation : PackedScene
@export var exp : PackedScene
@export var exp_amount : float
@export var sprite : Sprite2D

func _on_health_component_entity_died():
	var particles = death_animation.instantiate()
	particles.emitting = true
	particles.position = get_parent().position
	get_node("/root").add_child(particles)
	
	for i in range(exp_amount):
		var exp_node = exp.instantiate()
		exp_node.position = get_parent().position
		exp_node.slide()
		get_node("/root").add_child(exp_node)
		
	
	get_parent().queue_free()


func _on_health_component_health_changed():
	if sprite:
		sprite.modulate = Color(1, 0, 0);
		if get_tree() != null:
			await get_tree().create_timer(.1).timeout
		else:
			return
		sprite.modulate = Color(1, 1, 1);
