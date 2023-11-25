extends Area2D

@export var speed = 600


func _physics_process(delta):
	global_position.x += speed * delta 
# Called when the node enters the scene tree for the first time.



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
