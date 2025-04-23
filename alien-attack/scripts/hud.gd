extends Control

@onready var Score = $Score

func set_score_label(new_score):
	Score.text = "SCORE: " + str(new_score)
