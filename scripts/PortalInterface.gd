extends Area2D

func _on_PortalInterface_body_entered(body):
	if body.name == "Deimos":
		get_tree().change_scene("res://scenes/backgroundBoss.tscn")
