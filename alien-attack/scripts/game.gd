extends Node2D

var lives = 3
var scores = 0000

@onready var player = $Player
@onready var hud = $UI/HUD #HUD is a chld of the UI, so in this is how we reference it

func _ready():
	hud.set_score_label(scores)
	hud.set_lives(lives)

func _on_deathzone_area_entered(area: Area2D):
	area.die()


func _on_player_took_damage() -> void:
	lives -= 1

	if lives == 0:
		print("Game Over")
		player.die()
	hud.set_lives(lives)


func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died) 
	add_child(enemy_instance)

func  _on_enemy_died():
	scores += 100
	hud.set_score_label(scores)
