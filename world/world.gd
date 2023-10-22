extends Node2D

@onready var heartContainer = $CanvasLayer/heartContainer
@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	heartContainer.setMaxHP(player.maxHP)
	heartContainer.updateHP(player.currentHealth)
	player.HPChanged.connect(heartContainer.updateHP)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_inventory_closed():
	get_tree().paused = false


func _on_inventory_opened():
	get_tree().paused = true
	
