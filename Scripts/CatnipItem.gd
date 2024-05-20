extends Node2D

@onready var playerHealth = get_node('/root/Scene/Player').get_node("HealthComponent");

func _ready():
	playerHealth.maxHealth += 20
	playerHealth.damage(-10)

func _on_timer_timeout():
	playerHealth.damage(-1)
