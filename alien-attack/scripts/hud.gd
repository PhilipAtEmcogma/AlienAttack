extends Control

@onready var Score = $Score
@onready var lives_left = $LivesLeft

func set_score_label(new_score):
	Score.text = "SCORE: " + str(new_score)

func set_lives(amount):
	lives_left.text = str(amount)
