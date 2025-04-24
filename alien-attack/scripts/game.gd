extends Node2D

var lives = 3
var scores = 0

@onready var player = $Player
@onready var hud = $UI/HUD #HUD is a chld of the UI, so in this is how we reference it
@onready var ui = $UI

@onready var enemu_hit_sound = $EnemyHitSound
@onready var player_hit_sound = $PlayerHitSound

var gos_scene = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(scores)
	hud.set_lives(lives)

func _on_deathzone_area_entered(area: Area2D):
	area.queue_free()


func _on_player_took_damage() -> void:
	player_hit_sound.play()
	lives -= 1

	if lives == 0:
		print("Game Over")
		player.die()
		#wait awhile before showing Game Over Screen
		await get_tree().create_timer(1.5).timeout
		
		var gos = gos_scene.instantiate()
		gos.set_score(scores)
		ui.add_child(gos)
	hud.set_lives(lives)
	


func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died) 
	add_child(enemy_instance)

func  _on_enemy_died():
	scores += 100
	hud.set_score_label(scores)
	enemu_hit_sound.play()


func _on_enemy_spawner_path_enemy_spawn(path_enemy_instance: Variant) -> void:
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", _on_enemy_died)
