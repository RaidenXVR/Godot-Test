extends "res://npc/npc.gd"

@onready var animation = $AnimationPlayer


func _on_interact_zone_area_entered(area):
	print("entered npc1")
	if area.name == "player" and Input.is_action_pressed("interact"):
		print("Interacting with npc1")
		super(area)
	
