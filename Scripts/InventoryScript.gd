extends Resource

class_name Inventory

signal updated
signal heal_player(amount)
@export var slots: Array[InventorySlot]
var weapon: Array[String] = ["sword"]
var healing: Array[String] = ["healingGrass"]
@export var selected_slot: int

func insert(item: InventoryItems):
	var itemSlots = slots.filter(func(slot):return slot.item == item)
	if !itemSlots.is_empty() and !itemSlots[0].amount == itemSlots[0].maxAmount:
		itemSlots[0].amount +=1
	else:
		var emptySlots = slots.filter(func(slot): return slot.item==null)
		if !emptySlots.is_empty():
			emptySlots[0].item = item
			emptySlots[0].amount = 1
			if item.name in weapon:
				emptySlots[0].maxAmount = 1
			else:
				emptySlots[0].maxAmount = 5
	updated.emit()

func use_item(index:int):
	var item = slots[index].item
	if item == null: return
	
	item.use(self)
	if item.effects =="heal": emit_signal("heal_player", item.effect())

	if item.is_consumeable:
		slots[index].amount -=1
		if slots[index].amount <=0:
			slots[index].item = null

	updated.emit()	
	
