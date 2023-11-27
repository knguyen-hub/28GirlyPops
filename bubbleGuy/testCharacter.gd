extends CharacterBody2D

var character_pos : Vector2
var test_var
func _ready():
	character_pos = global_position
	test_var = 2

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y = -60
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 60
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -60
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 60
	else:
		velocity.x = 0
		velocity.y = 0
		
	
	character_pos = global_position
	#print(character_pos)
	move_and_slide()
