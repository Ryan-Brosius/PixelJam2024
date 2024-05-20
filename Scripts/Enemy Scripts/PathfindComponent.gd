extends Node2D

@export var velocityComponent : Node2D;

var direction = Vector2.ZERO
var targetDirection = Vector2.ZERO

func _physics_process(delta):
	followPath();
	
func followPath():
	
	if direction != null:
		direction = (targetDirection - global_position).normalized()
		velocityComponent.move()
	
func setTargetLocation(targetPosition):
	targetDirection = targetPosition
	
