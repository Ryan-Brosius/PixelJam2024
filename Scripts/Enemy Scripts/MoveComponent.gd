extends Node2D

@onready var characterBody = $"..";

@export var PathfindComponent : Node2D = null;

@export var MaxSpeed : float = 250;
@export var Accel : float = 20;

var Velocity = Vector2.ZERO;

func speedPercent():
	return max(min(Velocity.length() / MaxSpeed, 1), 0.01)

func AccelerateToVelocity(velocity):
	#WHAT THE FUCK IS THIS PIECE OF SHIT BELOW
	#AAA PLEASE FIX THIS
	var t = 1 - exp(-Accel * speedPercent())
	Velocity = Velocity.lerp(velocity, t)	

func AccelerateInDirection(direction):
	AccelerateToVelocity(direction * MaxSpeed)
	
func Decelerate():
	AccelerateToVelocity(Vector2.ZERO)
	
func move():
	characterBody.velocity = Velocity
	characterBody.move_and_slide();
	

