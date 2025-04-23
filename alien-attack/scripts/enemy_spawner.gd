extends Node2D

signal enemy_spawned(enemy_instance) #an signal that takes in an argunment

var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random() #randomly choose the position of one the the children array
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", enemy_instance) #this is how to emit an signal that takes in argument(s)
	add_child(enemy_instance)
