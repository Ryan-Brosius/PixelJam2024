extends CharacterBody2D

@export var velocityComponent : Node2D;
@export var pathfindComponent : Node2D;
@export var animatorComponent : Node2D;
@export var player : Node2D;

enum State {
	Moving,
	notMoving
}

var currentState = State.Moving

func _process(delta):
	if currentState == State.Moving:
		var direction = pathfindComponent.direction
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
	setState()
