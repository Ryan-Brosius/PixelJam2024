extends Control

@onready var hpBar = $HPBar
@onready var playerHealthComponent = $"../../Player".get_node("HealthComponent")

func _ready():
	hpBar.value = playerHealthComponent.currentHealth * 100 / playerHealthComponent.maxHealth

func _process(delta):
	hpBar.value = playerHealthComponent.currentHealth * 100 / playerHealthComponent.maxHealth
