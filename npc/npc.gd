extends CharacterBody2D


@onready var sprite: Sprite2D = $Sprite2D
@onready var interactZone: Area2D = $InteractZone
@export var already_talked: bool
var can_talk = false


func talk():
	print("NPC talking.")

func _input(event):
	if event.is_action_pressed("interact") and can_talk:
		self.talk()

func _on_interact_zone_area_entered(area):
	can_talk = true


func _on_interact_zone_area_exited(area):
	can_talk = false
