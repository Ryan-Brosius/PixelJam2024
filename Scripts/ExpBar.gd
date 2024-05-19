extends TextureProgressBar

@onready var player = $"../../../Player"
@onready var levelComponent = player.get_node("LevelComponent")

func _ready():
	levelComponent.expChanged.connect(update)
	update()
	
func update():
	value = levelComponent.currentExp * 100 / levelComponent.expMax
