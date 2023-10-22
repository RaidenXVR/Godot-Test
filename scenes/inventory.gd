extends Control

@onready var inventory: Inventory = preload("res://player/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


signal opened
signal closed

var is_open:bool = false

func _ready():
	inventory.updated.connect(update)
	update()

func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i], inventory)

func open():
	visible = true
	is_open = true
	opened.emit()
	
func close():
	visible = false
	is_open = false
	closed.emit()


	

