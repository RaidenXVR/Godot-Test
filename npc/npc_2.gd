extends "res://npc/npc.gd"

@onready var animation = $AnimationPlayer


func talk():
	if !self.already_talked:
		print("NPC2 Talking")
		already_talked = true
	else:
		print("Already talking to NPC2")
	

