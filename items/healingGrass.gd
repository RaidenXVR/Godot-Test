extends "res://scenes/collectibles.gd"

@onready var animation = $AnimationPlayer


func collect(inventory: Inventory):
	animation.play("spin")
	await animation.animation_finished
	super(inventory)

func use(inventory: Inventory):
	
	print("Use hiling")
