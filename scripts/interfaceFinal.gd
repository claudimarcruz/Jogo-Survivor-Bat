extends CanvasLayer

signal start_game

onready var animation: AnimationPlayer = get_node("Animation")
onready var button_container: Control = get_node("MessageContainer")

export(PackedScene) var sfx_scene

func on_button_pressed(button: Button) -> void:
	match button.name:
		"Message2":
			animation.play("in")
			yield(get_tree().create_timer(1.0), "timeout")
			var _reload = get_tree().reload_current_scene()
			
			
func game_over2() -> void:
	button_container.get_node("Message2").show() 
	
