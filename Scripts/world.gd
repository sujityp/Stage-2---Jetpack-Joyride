extends Node2D


@onready var ScoreLabel = $GUI/ScoreLabel
@onready var ScrollBackground = $ParallaxBackground

var score = 0
var score_mult = 0.01
var time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	set_score(0)
	ScrollBackground.set_speed(200.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_score(score + ScrollBackground.speed * delta * score_mult)


func set_score(new_score):
	score = new_score
	ScoreLabel.set_text(str(round(score)))


func make_pipe():
	pass
