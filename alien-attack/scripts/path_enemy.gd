extends Path2D

@onready var pathfollow = $PathFollow2D
@onready var enemy = $PathFollow2D/Enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#we set the progress ratio to start from 1 and descen to 0, its because
	# when we draw the path follow we start from the left hand side of the screen to the Right hand side
	# BUT the enemey is supposed to travel from right to left.  therefore need to invert the process.
	pathfollow.set_progress_ratio(1) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pathfollow.progress_ratio -= 0.25*delta #remember we set *delta to make it timeframe dependant
	#free the scene when the enemy had travel to the end of path.
	if pathfollow.progress_ratio <=0 :
		queue_free()
