extends CanvasLayer

signal start_game

onready var animation: AnimationPlayer = get_node("Animation")
onready var score_container: Control = get_node("ScoreContainer")
onready var button_container: Control = get_node("MessageContainer")
onready var portal: Area2D = get_node("PortalInterface")

var score: int = 100

var cont: int = 0

export(PackedScene) var sfx_scene

func _ready() -> void:
	animation.play("fade_Out")
	for button in button_container.get_children():
		button.connect("pressed", self, "on_button_pressed", [button])
		

func on_button_pressed(button: Button) -> void:
	match button.name:
		"Message":
			button_container.get_node("Message").hide()
			score_container.show()
			emit_signal("start_game")
			
		"GameOver":
			animation.play("fade_In")
			yield(get_tree().create_timer(1.0), "timeout")
			var _reload = get_tree().reload_current_scene()
			cont = cont +1
		
			
func update_score() -> void:
	score_container.get_node("Text").show()
	score -= 1
	score_container.get_node("Text").text = str(score)
	if score <= 0:
		print("passou")
		portal.show()
		score_container.get_node("Text").hide()
	elif cont > 1:
		portal.hide()
		
	
	
func game_over() -> void:
	button_container.get_node("GameOver").show()
	score_container.get_node("Text").text = str(" ")
	

func spawn_sfx(effect: String) -> void:
	var sfx: SoundEffect = sfx_scene.instance()    
	sfx.stream = load(effect)
	get_tree().root.call_deferred("add_child", sfx)





