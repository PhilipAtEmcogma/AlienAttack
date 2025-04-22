extends Area2D

@export var speed = 500

func _physics_process(delta: float) -> void:
	global_position.x += -speed*delta

func die():
	queue_free()
