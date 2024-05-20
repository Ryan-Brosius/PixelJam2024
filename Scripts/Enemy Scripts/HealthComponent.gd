extends Node2D

signal healthChanged
signal entityDied

@export var health: float
var isDead = false
var damageMultiplier = 1

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
	maxHealth = health
	currentHealth = health

func damage(damage):
	if damage > 0:
		currentHealth -= damage * damageMultiplier
	else:
		currentHealth -= damage
