extends CharacterBody2D


@export var JUMP_VELOCITY = 300.0
@export var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
#@export var alive = false
@export var vel_rotation_ratio = 0.1

@onready var animPlayer = $AnimationPlayer
@onready var flapSound = $FlapSound

var Bullets = preload("res://Scenes/bullet.tscn")

signal dead


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("fly"):# and alive:
		velocity.y = -JUMP_VELOCITY
		animPlayer.play("flap")
		if not flapSound.is_playing():
			flapSound.play(0.05)
		
		var bullet = Bullets.instantiate()
		bullet.global_position = global_position
		get_parent().add_child(bullet)
	
	rotation_degrees = vel_rotation_ratio * velocity.y
	move_and_slide()
#	check_alive_state()


#func check_alive_state():
#	if is_on_ceiling() or is_on_floor() or is_on_wall():
#		emit_signal("dead")
#		alive = false


#func reset():
#	alive = true
#	position = Vector2(72, 230)
#	velocity = Vector2(0, -JUMP_VELOCITY)
