extends Path2D


# Called when the node enters the scene tree for the first time.
@onready var second_path = $PathFollow2D
func _ready():
	second_path.set_progress_ratio(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	second_path.progress_ratio -= 0.10 * delta
	if(second_path.progress_ratio <= 0):
		queue_free()
