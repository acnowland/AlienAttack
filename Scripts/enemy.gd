extends Area2D

@export var enemy_speed = 400
signal enemy_killed
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	global_position.x += -enemy_speed * delta
	
func die():
	queue_free()
	emit_signal("enemy_killed")

func _on_body_entered(body):
	body.take_damage()
	queue_free()
