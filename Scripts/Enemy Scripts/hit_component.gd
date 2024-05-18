extends Node2D

@export var death_animation : PackedScene
@export var sprite : Sprite2D

func _on_health_component_entity_died():
	var particles = death_animation.instantiate()
	particles.emitting = true
	particles.position = get_parent().position
	get_node("/root").add_child(particles)
	get_parent().queue_free()


func _on_health_component_health_changed():
	if sprite:
		sprite.modulate = Color(1, 0, 0);
		await get_tree().create_timer(.1).timeout
		sprite.modulate = Color(1, 1, 1);
