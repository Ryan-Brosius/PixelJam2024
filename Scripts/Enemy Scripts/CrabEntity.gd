extends CharacterBody2D

@export var velocityComponent : Node2D;
@export var pathfindComponent : Node2D;
@export var animatorComponent : Node2D;
@onready var player = get_node('/root/Scene/Player');

var current_tick = 3
var move_num_of_ticks = 3
enum State {
	Moving,
	notMoving
}

var currentState = State.Moving

func _process(delta):
	if currentState == State.Moving:
		var direction = pathfindComponent.direction
		if is_instance_valid(player):
			pathfindComponent.setTargetLocation(player.global_position)
		velocityComponent.AccelerateInDirection(direction);
	elif currentState == State.notMoving:
		velocityComponent.Decelerate();
		
		
func setState():
	if currentState == State.Moving:
		currentState = State.notMoving
	else:
		currentState = State.Moving;
		animatorComponent.lean_other_way()

func _on_timer_timeout():
	if currentState == State.notMoving:
		setState()
	elif current_tick == 3:
		setState()
		current_tick = 0
	else:
		current_tick += 1
