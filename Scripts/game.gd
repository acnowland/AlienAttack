extends Node2D


var lives = 3
var score = 0

var end_game_scene = preload("res://Scenes/game_over_screen.tscn")
@onready var player = $Player
@onready var hud = $GameUI/HUD
@onready var ui = $GameUI

func _ready():
	hud.set_score_label(score)
	hud.set_lives_left(lives)
	
func _on_deathzone_area_entered(area):
	area.queue_free()
	
func _on_player_took_damage():
	lives -= 1
	hud.set_lives_left(lives)
	
	if(!(score == 0)):
		score -= 100
	hud.set_score_label(score)
	
	$Audio/PlayerHit.play()
	if(lives == 0):
		player.die()
		#show game over screen
		await get_tree().create_timer(1).timeout
		var end_instance = end_game_scene.instantiate()
		end_instance.set_score(score)
		ui.add_child(end_instance)
		


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("enemy_killed", on_enemy_death)
	add_child(enemy_instance)
	
func on_enemy_death():
	score += 100
	$Audio/EnemyHit.play()
	hud.set_score_label(score)


func _on_enemy_spawner_path_enemy_spawned(enemy_instance):
	add_child(enemy_instance)
