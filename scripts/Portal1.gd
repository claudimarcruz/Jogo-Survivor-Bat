extends Area2D

func _on_Portal1_body_entered(body):
	get_tree().change_scene("res://scenes/backgroundBoss.tscn")
