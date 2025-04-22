extends Area2D

#exporting the variable so it can be change in the inspector window, 
# instead of needing to go into the script everytime.
@export var speed = 200 

@onready var visible_notifier = $VisibleNotifier

func _ready():
	#use connect to connect signal to a variable
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta: float):
	# one problem with the calculating the speed below, is the actual speed of the
	# rocket is determined by the frame rate the programe runs on.  i.e. if framrate of is 60,
	# then speed is 60 * 5 = 30 pixel per second. 
	# but if the machine refreshes at 30 frames per second, then speed is 15pixel per second.
	#global_position.x += speed 
	
	#below is the proper rate to make the speed independt of the frame rate, so speed is consistent
	# across different framerate.  NOTE: delta means delta time, which meant how long has in time it passed.
	global_position.x += speed*delta

func _on_screen_exited():
	queue_free() #delete when rocket exit screen, Godot know it is exited when the VisibleNotifier node exit scren	
