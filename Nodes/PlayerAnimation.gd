extends AnimatedSprite2D

@onready var player = $".."

var prev_input

func _physics_process(delta):
	
	set_input()
	if player.velocity != Vector2.ZERO:
		anim_forward(bool(player.input.x))
	else:
		pause()
	
func set_input():
	if player.input.x == 0:
		return
	elif player.input.x == 1:
		prev_input = false
	elif player.input.x == -1:
		prev_input = true
	
func anim_forward(direction):
	flip_h = prev_input
	play("walk")
	
