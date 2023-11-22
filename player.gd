extends CharacterBody2D

var gravity = 7
var speed = 60
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		$QueenSprite.play("walk")
		$QueenSprite.flip_h = false
		velocity.x += -speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x += speed
		$QueenSprite.play("walk") 
		$QueenSprite.flip_h = true 
	else:
		velocity.x = 0
		$QueenSprite.play("idle")
	
	velocity.y += gravity 
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -200
		
	move_and_slide()
	

