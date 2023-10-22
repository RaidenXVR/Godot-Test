extends CharacterBody2D

signal HPChanged

@export var speed:int=40
@export var maxHP:int = 5
@export var knockPower:int =1000
@export var inventory: Inventory
@export var stats = Stats.new()
@onready var timer = $Timer
@onready var hurtTimer = $hurtTimer
@onready var animation = $AnimationPlayer


var lastAnimDir: String = "Down"
var is_stunned : bool = false
var currentHealth : int = maxHP
var is_damaged: bool = false
var is_attacking: bool = false


func _ready():
	stats.att = 5
	stats.mhp = maxHP
	stats.hp = maxHP
	inventory.connect("heal_player", heal)


func handleInput():
	var moveDir = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	if is_stunned:
		moveDir = Vector2.ZERO
	moveDir.y = -moveDir.y
	velocity = moveDir *speed
	if Input.is_action_just_pressed("attack"):
		animation.play("attack"+lastAnimDir)
		is_attacking = true
		is_stunned = true
		await animation.animation_finished
		is_stunned = false
		is_attacking = false

func updateAnimation():
	if is_attacking: return
	if velocity.length() == 0:
		animation.play("walk"+lastAnimDir)
		animation.stop()
	else:
		var dir = "Down"
		if velocity.x < 0: dir = "Left"
		elif velocity.x > 0 : dir = "Right"
		elif velocity.y<0: dir = "Up"
		
		lastAnimDir = dir
		animation.play("walk"+dir)
		
		
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
	if timer.time_left<0.05 and !timer.is_stopped(): unstun() 
	if hurtTimer.time_left<0.05 and !hurtTimer.is_stopped(): unHurt()


func _on_hitbox_area_entered(area):
	if area.name == 'HitboxEnemy':
		knockback(area.get_parent().velocity)
		if is_damaged: return
		stats.take_damage(area.get_parent().stats.att)
		if stats.hp < 0:
			stats.hp = maxHP
		HPChanged.emit(stats.hp)
		
		hurtTimer.start(1)
		is_damaged = true
	if area.has_method("collect"):
		area.collect(inventory)

func unstun():
	timer.stop()
	is_stunned = false
func unHurt():
	hurtTimer.stop()
	is_damaged = false
func knockback(enemyVelocity: Vector2):
	var knockDir = (enemyVelocity - velocity).normalized() * knockPower
	velocity = knockDir
	move_and_slide()
	is_stunned = true
	timer.start(0.8)
	

func heal(amount:int):
	stats.heal_self(amount)
	HPChanged.emit(currentHealth)




