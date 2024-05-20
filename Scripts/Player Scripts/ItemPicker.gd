extends Control

@onready var texture1 = $Button3/TextureRect
@onready var label1 = $Button3/Label
@onready var texture2 = $Button/TextureRect
@onready var label2 = $Button/Label
@onready var texture3 = $Button2/TextureRect
@onready var label3 = $Button2/Label

@onready var player = $"../../Player"
@onready var levelComponent = player.get_node("LevelComponent")

# 3 -> 1 -> 2

var item1;
var item2;
var item3;

var catnip = {
	"Name" : "Cat Nip",
	"Sprite" : load("res://Sprites/ItemPortraits/catnip.png"),
	"Instance" : preload("res://Nodes/Items/catnip_item.tscn")
}
var rockets = {
	"Name" : "Sea-Missiles",
	"Sprite" : load("res://Sprites/ItemPortraits/MissilePortrait.png"),
	"Instance" : preload("res://Nodes/Items/missile_item.tscn")
}
var lazer = {
	"Name" : "Extra Lazer",
	"Sprite" : load("res://Sprites/ItemPortraits/ExtraLazer.png"),
	"Instance" : preload("res://Nodes/Items/lazer_item.tscn")
}
var yarn = {
	"Name" : "Yarn-YoYo",
	"Sprite" : load("res://Sprites/yarnball.png"),
	"Instance" : preload("res://Nodes/Items/yarnyoyo_item.tscn")
}
var miku = {
	"Name" : "Idol Food",
	"Sprite" : load("res://Sprites/idolFood.png"),
	"Instance" : preload("res://Nodes/Items/idol_item.tscn")
}
var items = [catnip, rockets, lazer, yarn, miku]

func _ready():
	levelComponent.leveledUp.connect(levelUp)
	visible  = false
	generateItems()
	
func generateItems():
	item1 = randi_range(0, items.size()-1)
	item2 = randi_range(0, items.size()-1)
	while item2 == item1:
		item2 = randi_range(0, items.size()-1)
	item3 = randi_range(0, items.size()-1)
	while item3 == item1 or item3 == item2:
		item3 = randi_range(0, items.size()-1)

func levelUp():
	get_tree().paused = true
	generateItems()
	visible = true
	
	texture1.texture = items[item1]['Sprite']
	label1.text = items[item1]['Name']
	
	texture2.texture = items[item2]['Sprite']
	label2.text = items[item2]['Name']
	
	texture3.texture = items[item3]['Sprite']
	label3.text = items[item3]['Name']
	
#3 1 2
#MIDDLE BUTTON
func _on_button_button_up2():
	print("button1")
	
	var item = items[item2]['Instance'].instantiate()
	player.add_child(item)
	visible = false
	get_tree().paused = false

#RIGHT BUTTON
func _on_button_2_button_up():
	print("button2")
	var item = items[item3]['Instance'].instantiate()
	player.add_child(item)
	visible = false
	get_tree().paused = false

#CENTER BUTTON
func _on_button_3_button_up1():
	print("button3")
	var item = items[item1]['Instance'].instantiate()
	player.add_child(item)
	visible = false
	get_tree().paused = false
