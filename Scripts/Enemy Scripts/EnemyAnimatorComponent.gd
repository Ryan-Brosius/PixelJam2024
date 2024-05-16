extends Node2D

@onready var sprite2D = $"../Sprite2D"

@export var degrees : float;
@export var time : float;

var speed;
var lean_right = true;

func _ready():
	speed = degrees*2/time

func _process(delta):
	if degrees < 0:
		sprite2D.rotation_degrees = max(degrees, sprite2D.rotation_degrees - delta * speed)
	else:
		sprite2D.rotation_degrees = min(degrees, sprite2D.rotation_degrees + delta * speed)


func lean_other_way():
	degrees = -degrees
