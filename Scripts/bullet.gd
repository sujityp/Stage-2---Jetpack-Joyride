extends CharacterBody2D


@export var bullet_speed = 1000
@export var rand_angle_range = 15
@export var bounce_speed = 200
@export var gravity = 50

var rotate_towards = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(randi_range(-150,150), bullet_speed)
	$Bullet1.show()
	$Bullet2.hide()

func _physics_process(delta):
	velocity.y += gravity
	rotation = move_toward(rotation, rotate_towards, 0.3)
	if move_and_slide():
		bullet_speed = -randf_range(0.3,0.5) * bullet_speed
		velocity = Vector2(velocity.x - 200, bullet_speed)
		rotate_towards = randi_range(-60,60)
		$Bullet2.show()
		$Bullet1.hide()
		


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
