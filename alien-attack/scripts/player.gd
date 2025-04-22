extends CharacterBody2D

var speed = 400 #note, the number means the number of pixels to move.
var rocket_scene = preload("res://scenes/rocket.tscn")

# @onready var rocket_container = get_node("RocketContainer")
@onready var rocket_container = $RocketContainer #NOTE: this line and the line above it, its identical. bot do something when onReady() is first run.

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta: float):
	# velocity is a special variable under the _physcs_process, that give the object a velocity.
	#velocity = Vector2(100,0) #not this is use to set x and y velocity simulatneously.
	velocity = Vector2(0,0) #reset velocity to 0 at the start of each frame.
	
	if Input.is_action_pressed("move_right"):
		velocity.x = speed #setting velocity on the x axis for right
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed #setting velocity on the x axis for left
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed #setting velocity on the y axis for up
	if Input.is_action_pressed("move_down"):
		velocity.y = speed #setting velocity on the y asix for down
	
	#make the object move, but make sure velocity is assigned first before calling this functon.
	move_and_slide()
	
	#constraining the player won't be out of the window screen
	#use get_viewport_rect().size to get the max size of the game window.
	var screen_size = get_viewport_rect().size
	#global_positions gives a vector2 results
	#if global_position.x < 0:
		#global_position.x= 0
	#if global_position.x >= screen_size.x:
		#global_position.x = screen_size.x
	#if global_position.y < 0:
		#global_position.y= 0
	#if global_position.y >= screen_size.y:
		#global_position.y = screen_size.y
	
	#clampf = clamp float, use to compare the input value with given max and min value, and limit 
	# the input value if its out of bounds. using this to bound player within the screen.
	#global_positoin.x = clampf(global_position.x, 0, screen_size.x)
	#global_positoin.y = clampf(global_position.y, 0, screen_size.y)
	global_position = global_position.clamp(Vector2(0,0), screen_size)
	
func shoot():
	#load rocket scene evertime this function is called
	# not ideal, so change to preload and load it once at the beginning as global variable.
	# loading a file, an easy way to get the path of a file wanted to load, left click and hold file
	# then drage and drop.
	#var rocket_scene = load("res://scenes/rocket.tscn") 
	var rocket_instance = rocket_scene.instantiate() #creating a new instance of the rocket 
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 80
