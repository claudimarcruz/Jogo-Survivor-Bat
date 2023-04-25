extends Area2D

var direcao = null

func set_direcao(x):
	direcao = x
	
func _process(delta):
	if(direcao): translate(direcao * 600 * delta)
	
func _on_Area2D_area_entered(area):
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
