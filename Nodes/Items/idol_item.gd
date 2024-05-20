extends Node2D

@onready var playerHealth = get_node('/root/Scene/Player').get_node("HealthComponent");
@onready var playerLazer = get_node('/root/Scene/Player/Lazer Gun/RayCast2D')

func _ready():
	playerHealth.damageMultiplier += .5
	playerLazer.damage += 50
	

