extends CharacterBody2D

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * 6000 * delta;
	move_and_slide()
