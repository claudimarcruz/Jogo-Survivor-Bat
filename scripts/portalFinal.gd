extends Area2D

func _on_portalFinal_body_entered(body):
	if body.name == "Deimos":
		get_tree().change_scene("res://scenes/final.tscn")
