extends Control


func _on_jogar_pressed():
	get_tree().change_scene("res://scenes/cemetery.tscn")

func _on_controles_pressed():
	var controles = load("res://scenes/controles.tscn").instance()
	get_tree().current_scene.add_child(controles)

func _on_historiaJogo_pressed():
	var historia = load("res://scenes/historia.tscn").instance()
	get_tree().current_scene.add_child(historia)


func _on_creditos_pressed():
	var creditos = load("res://scenes/creditos.tscn").instance()
	get_tree().current_scene.add_child(creditos)

func _on_sair_pressed():
	get_tree().quit()
