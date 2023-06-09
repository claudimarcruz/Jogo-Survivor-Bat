extends CanvasLayer

signal start_game

onready var animation: AnimationPlayer = get_node("AnimationPlayer")
onready var button_container: Control = get_node("MessageContainer")


export(PackedScene) var sfx_scene

func _ready() -> void:
	animation.play("fade_out")
	for button in button_container.get_children():
		button.connect("pressed", self, "on_button_pressed", [button])
		

func on_button_pressed(button: Button) -> void:
	match button.name:
		"Message":
			button_container.get_node("Message").hide()
			emit_signal("start_game")
			
		"GameOver":
			animation.play("fade_in")
			yield(get_tree().create_timer(1.0), "timeout")
			var _reload = get_tree().reload_current_scene()
				
	
func game_over() -> void:
	button_container.get_node("GameOver").show()
	
	
func spawn_sfx(effect: String) -> void:
	var sfx: SoundEffect = sfx_scene.instance()    
	sfx.stream = load(effect)
	get_tree().root.call_deferred("add_child", sfx)


