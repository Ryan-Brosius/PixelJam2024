extends Node2D

@onready var player = get_node('/root/Scene/Player');
@export var contact_damage = 10.0
@export var area2D = Area2D

var isContact = false
var firstContact = false

func _ready():
	area2D.body_entered.connect(_on_area_entered)
	area2D.body_exited.connect(_on_area_exited)
	
func _on_area_entered(body):
	if body.is_in_group("Player"):
		body.get_node("HealthComponent").damage(contact_damage)
		firstContact = true
		isContact = true

func _on_area_exited(body):
	if body.is_in_group("Player"):
		isContact = false

func _on_timer_timeout():
	if isContact:
		if not firstContact:
			player.get_node("HealthComponent").damage(contact_damage)
		firstContact = false
