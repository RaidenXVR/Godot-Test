extends CharacterBody2D


@onready var sprite: Sprite2D = $Sprite2D
@onready var interactZone: Area2D = $InteractZone




func _on_interact_zone_area_entered(area):
	print("entering npc")
	if area.name == "player" and Input.is_action_pressed("interact"):
		print("Interacting with npc")
		
	
