extends Control

func _ready():
	get_tree().paused = false
	$Node/CanvasLayer/MainTitle/VBoxContainer2.visible = true
	$Node/CanvasLayer/MainTitle/Credits.visible = false

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_credits_button_up():
	$Node/CanvasLayer/MainTitle/VBoxContainer2.visible = false
	$Node/CanvasLayer/MainTitle/Credits.visible = true

func _on_back_pressed():
	$Node/CanvasLayer/MainTitle/VBoxContainer2.visible = true
	$Node/CanvasLayer/MainTitle/Credits.visible = false
