extends Node2D

@export var gravity = 9.2;
@onready var player = get_node('/root/Scene/Player');
@onready var sprite = $Sprite2D

var go_to_player = false
var player_pos = Vector2.ZERO

var isSlide = false
var slideDir = Vector2.ZERO
var slideForce = 20.0
var friction = 10.0

func _ready():
	pass

func _process(delta):
	if go_to_player:
		isSlide = false
		if player:
			player_pos = player.global_position
		lerp_player(delta)
		
	if isSlide:
		global_position += slideDir * delta
		slideDir -= friction * delta * slideDir.normalized()
		if slideDir.length() < .5:
			isSlide = false
		
func lerp_player(delta):
	var distance = (player_pos - global_position)
	
	if distance.length() < 5:
		if player.has_node("LevelComponent"):
			player.get_node("LevelComponent").addExp(1);
		queue_free()
	
	var direction = gravity * (distance / (distance.length() * distance.length()))
	position += direction * delta if direction.length() * delta < 10 else distance * 10
	
func collect():
	go_to_player = true
	
func slide():
	isSlide = true
	randomize()
	var x = randf_range(-1, 1)
	var y = randf_range(-1, 1)
	slideDir = Vector2(x, y).normalized() * slideForce * randf_range(.6, 1.3)
	
