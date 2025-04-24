extends Node2D

signal enemy_spawned(enemy_instance) #an signal that takes in an argunment
signal path_enemy_spawn(path_enemy_instance)

var enemy_scene = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn")

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


func _on_path_enemy_timer_timeout() -> void:
	pass # Replace with function body.
	
func spawn_path_enemy():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawn", path_enemy_instance)
