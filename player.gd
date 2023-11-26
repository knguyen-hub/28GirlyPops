extends CharacterBody2D

var gravity = 7
var speed = 300
var laser_scene = preload("res://laser.tscn")
signal laser_shot(laser_scene, location)

@onready var muzzle = $Muzzle


func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _process2(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed 
		$QueenSprite.play("walkingqueen")
		$QueenSprite.flip_h = true 
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed 
		$QueenSprite.play("walkingqueen")
		$QueenSprite.flip_h = false
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed 
		$QueenSprite.play("jumpingqueen")
	else:
		velocity.x = 0
		$QueenSprite.play("idlequeen")
		$QueenSprite.flip_h = false
		
	velocity.y += gravity 
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -120
	move_and_slide()

func shoot():
	laser_shot.emit(laser_scene, muzzle.global_position)
