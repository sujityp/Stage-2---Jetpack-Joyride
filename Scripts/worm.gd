extends CharacterBody2D


@export var speed = 20.0
var moving = true


func _process(delta):
	velocity = Vector2.LEFT * speed
	move_and_slide()
