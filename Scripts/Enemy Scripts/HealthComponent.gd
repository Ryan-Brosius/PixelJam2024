extends Node2D

signal healthChanged
signal entityDied

@export var health: float = 20.0;
var isDead = false

var currentHealth : float :
	get:
		return currentHealth
	set (value):
		currentHealth = clamp(value, 0, maxHealth)
		emit_signal("healthChanged")
		if currentHealth == 0:
			isDead = true
			emit_signal("entityDied")

var maxHealth = health

func _ready():
	currentHealth = health

func damage(damage):
	currentHealth -= damage
