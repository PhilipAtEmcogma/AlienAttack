extends Area2D

@export var speed = 500

func _physics_process(delta: float) -> void:
	global_position.x += -speed*delta

func die():
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	#apply damage to player upon entering the enemy physics body
	body.take_damage()
	die()
