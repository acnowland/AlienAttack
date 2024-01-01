extends CharacterBody2D

var speed = 400
var rocketScene = preload("res://Scenes/rocket.tscn")

signal took_damage
@onready var rocket_container = $RocketContainer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	# setup movement 
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed	
	move_and_slide()
	
	
	# setup bounds
	var screenSize = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), screenSize)
	
func shoot(): 
	var rocket_instance = rocketScene.instantiate()
	rocket_container.add_child(rocket_instance)
	
	# set the rocket positition equal to the player position when spawns
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 70 
	$WeaponFire.play()
	
func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()
