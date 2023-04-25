extends Position2D

signal game_over

onready var timer: Timer = get_node("Timer")

export(float) var spawn_cooldown
export(PackedScene) var obs_scene

func spawn() -> void:
	var obs: Obstaculos = obs_scene.instance()
	obs.global_position = random_position()
	var _game_over = connect("game_over", obs, "game_over")
	add_child(obs)
	timer.start(spawn_cooldown)
	
	
func random_position() -> Vector2:
	randomize()
	var random_number: float = rand_range(-200, 100)
	return Vector2(0, random_number)
	
func game_over() -> void:
	timer.stop()
	emit_signal("game_over")


func on_timer_timeout() -> void:
	spawn()
