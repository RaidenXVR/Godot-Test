extends Node

class_name  Stats

@export var mhp: int = 5
@export var att: int = 3
@export var hp :int = 5
@export var def: int = 2


	
func take_damage(damage:int):
	hp -= (damage-def)

func heal_self(amount:int):
	hp+= amount
	if hp > mhp:
		hp = mhp
	

