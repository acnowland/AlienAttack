extends Area2D

@export var bulletSpeed = 660

@onready var notifier = $VisibleNotifier

func _ready():
	notifier.connect("screen_exited", _on_screen_exited)
	
func _physics_process(delta):
	global_position.x += bulletSpeed * delta
	
func _on_screen_exited():
	queue_free()


func _on_area_entered(area):
	queue_free()
	area.die()
