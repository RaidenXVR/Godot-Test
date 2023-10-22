extends HBoxContainer

@onready var heartGUI = preload("res://scenes/heart.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setMaxHP(mhp: int):
	for i in range(mhp):
		var heart = heartGUI.instantiate()
		add_child(heart)
		
func updateHP(currentHP:int):
	var hearts = get_children()
	
	for i in range(currentHP):
		hearts[i].update(true)
		
	for i in range(currentHP, hearts.size()):
		hearts[i].update(false)
		
