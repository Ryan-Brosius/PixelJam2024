extends Node2D

signal expChanged

var level = 0
var currentExp = 0
var expMax = 10

func addExp(exp):
	currentExp += exp
	
	if currentExp >= expMax:
		currentExp = currentExp - expMax
		levelUp()
	emit_signal("expChanged")
	
func levelUp():
	level+=1
	pass

func _on_area_2d_area_entered(area):
	if area.get_parent().is_in_group("EXP"):
		area.get_parent().collect()
