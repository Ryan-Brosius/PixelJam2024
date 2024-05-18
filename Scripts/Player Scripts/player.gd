extends CharacterBody2D

#Player movement, fish-like movement(?)
#I would like to make it so character points towards normal vector
const max_speed = 200;
const accel = 800;
const friction = 400;

var input = Vector2.ZERO;

@export var health = 3 # if you need me to move this just lmk! :3

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"));
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"));
	
	if (Input.is_action_pressed("shoot")):
		shoot()
	else:
		$"Lazer Gun/RayCast2D".is_casting = false;
	return input.normalized();
	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * friction * delta
		else:
			velocity = Vector2.ZERO;
	else:
		velocity += input * accel * delta
		velocity = velocity.limit_length(max_speed)
		
	move_and_slide();

func shoot():
	$"Lazer Gun".shoot()
