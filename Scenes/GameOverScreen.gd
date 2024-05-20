extends Control

@onready var player = $"../../Player"
@onready var HealthComponent = player.get_node("HealthComponent")

func _ready():
	HealthComponent.entityDied.connect(GameOver)
	visible  = false

func _on_button_button_up():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
func GameOver():
	visible  = true
	get_tree().paused = true
