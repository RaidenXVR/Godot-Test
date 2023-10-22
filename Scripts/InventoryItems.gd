extends Resource

class_name InventoryItems



@export var name: String = ""
@export var texture: Texture2D
@export var is_consumeable: bool = false
@export var effects: String = ""

func effect():
	pass

func use(inventory: Inventory):
	
	pass
