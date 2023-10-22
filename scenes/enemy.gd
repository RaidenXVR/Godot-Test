extends CharacterBody2D


@export var player: Node2D
@export var alertThreshold: int = 200
@export var speed:int = 30
@export var knockPower:int = 1000
@export var stats = Stats.new()
@onready var timer = $Timer
@onready var timerRand = $RandTimer
@onready var alertTimer = $AlertTimer
@onready var animation = $AnimatedSprite2D
@onready var nav_agent = $NavigationAgent2D

var dir = Vector2.ZERO
var alert


func _ready():
	stats.mhp=10
	stats.def=1
	stats.hp = stats.mhp

func _physics_process(delta):
	animation.play("default")

	if timerRand.time_left <= 0.01:
		dir = randomDir().normalized()
		alertTimer.one_shot = false
	if timer.time_left <= 0.01:
		makeDirPlayer()
	
	
	if checkDistance() and !alert:
		alertTimer.start()
		alert = true
#		print_debug("alert")
	elif !checkDistance():
		alert = false
	if checkDistance():
		if alertTimer.time_left>= 0.05:
			speed = 0
			
		else:
			alertTimer.stop()
			speed = 50

		dir = to_local(nav_agent.get_next_path_position()).normalized()
	else:
		speed = 30

	velocity = dir * speed
#	print_debug(alertTimer.time_left)
	move_and_slide()

func makeDirPlayer():
	nav_agent.target_position = player.global_position
	
func randomDir():
	var new_dir = Vector2()
	new_dir.x = randf_range(-1,1)
	new_dir.y = randf_range(-1,1)
	return new_dir.normalized()

func checkDistance():
	return nav_agent.distance_to_target() < alertThreshold


	


func _on_hitbox_enemy_area_entered(area):
	if area.name == "Hitbox":
		var knockDir = -velocity.normalized() * knockPower
		velocity = knockDir
		move_and_slide()
		alertTimer.start(1)


func _on_hurtbox_area_entered(area):
	if area.name == "AttackBox" and alertTimer.is_stopped(): 
		var knockDir = -velocity.normalized() * knockPower
		velocity = knockDir
		move_and_slide()
		alertTimer.start(0.8)
		stats.take_damage(player.stats.att)
		if stats.hp <= 0:
			queue_free()
	
