extends Control

func _on_retry_pressed():
	get_tree().reload_current_scene()


func set_score(new_score):
	$Panel/Score.text = "Score: " + str(new_score)
