extends CharacterBody2D

@export var velocityComponent : Node2D;
@export var pathfindComponent : Node2D;
@export var animatorComponent : Node2D;
var _targetPos = Vector2.ZERO

var current_tick = 3
var move_num_of_ticks = 3
enum State {
	Moving,
	notMoving
}

var currentState = State.Moving

func _process(delta):
	if global_position.y < -160:
		queue_free()
	
	pathfindComponent.targetDirection = _targetPos
	if currentState == State.Moving:
		var direction = pathfindComponent.direction
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
