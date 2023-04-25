extends Area2D

func _on_Portal3_body_entered(body):
	if body.name == "Deimos":
		get_tree().change_scene("res://scenes/main.tscn")
