extends CharacterBody2D


@export var JUMP_VELOCITY = 300.0
@export var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var alive = false
@export var vel_rotation_ratio = 0.1

@onready var animPlayer = $AnimationPlayer
@onready var loopGunSFX = $LoopingGunSFX
@onready var endGunSFX = $EndGunSFX

var Bullets = preload("res://Scenes/bullet.tscn")

signal dead


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("fly"):# and alive:
		velocity.y = -JUMP_VELOCITY
		animPlayer.play("flap")
		endGunSFX.stop()
		if not loopGunSFX.is_playing():
			loopGunSFX.play()
		var bullet = Bullets.instantiate()
		bullet.global_position = global_position
		get_parent().add_child(bullet)
	elif Input.is_action_just_released("fly"):
		loopGunSFX.stop()
		endGunSFX.play()
	
	rotation_degrees = vel_rotation_ratio * velocity.y
	move_and_slide()
