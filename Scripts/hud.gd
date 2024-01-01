extends Control

@onready var score = $Score
@onready var lives_left = $Lives

func set_score_label(new_score):
	score.text = "Score: " + str(new_score)

func set_lives_left(lives):
	lives_left.text = "x " + str(lives)
