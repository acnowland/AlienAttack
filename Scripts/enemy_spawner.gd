extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(enemy_instance)
@onready var enemy_scene = preload("res://Scenes/enemy.tscn")
@onready var path_enemy_scene = preload("res://Scenes/enemy_path.tscn")
@onready var second_path_enemy_scene = preload("res://Scenes/enemy_second_path.tscn")
@onready var spawn_locations = $SpawnLocation.get_children()
func _on_timer_timeout():
	spawn_enemy()
	
func spawn_enemy():
	var random_spawn = spawn_locations.pick_random()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn.global_position
	emit_signal("enemy_spawned", enemy_instance)


func _on_enemy_path_timer_timeout():
	spawn_path_enemy()
	

func spawn_path_enemy():
	var path_scenes = [path_enemy_scene, second_path_enemy_scene]
	var path_enemy_instance = path_scenes.pick_random().instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
	

func _on_rage_timer_timeout():
	if($Timer.wait_time > 0.5):
		$Timer.set_wait_time($Timer.wait_time - 0.3)
	if($EnemyPathTimer.wait_time > 0.8):
		$EnemyPathTimer.set_wait_time($EnemyPathTimer.wait_time - 0.3)
		
