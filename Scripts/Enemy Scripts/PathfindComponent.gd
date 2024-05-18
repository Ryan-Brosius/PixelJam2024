extends Node2D

@export var NavAgent : NavigationAgent2D;
@export var velocityComponent : Node2D;

var direction = Vector2.ZERO
var targetDirection

func _physics_process(delta):
	followPath();
	
func followPath():
	if NavAgent.is_navigation_finished():
		velocityComponent.Decelerate();
		return;
	
	direction = to_local((NavAgent.get_next_path_position())).normalized()
	velocityComponent.move()
	
func setTargetLocation(targetPosition):
	targetDirection = targetPosition
	
func makePath():
	NavAgent.target_position = targetDirection
	
func _on_timer_timeout():
	makePath();
