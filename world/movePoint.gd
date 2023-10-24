extends Area2D

var entered :bool = false


func _on_body_entered(body):
		entered = true


func _on_body_exited(body):
		entered= false
		
func _process(delta):
	if entered:
		get_tree().change_scene_to_file("res://world/world_2.tscn")
