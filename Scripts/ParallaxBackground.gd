extends ParallaxBackground


@export var speed: float
@export var direction = Vector2.LEFT


func _process(delta):
	scroll_base_offset += (speed * direction) * delta

func set_speed(new_speed):
	self.speed = new_speed
