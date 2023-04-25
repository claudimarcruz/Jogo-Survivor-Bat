extends Node2D

onready var bat: KinematicBody2D = get_node("Deimos")
onready var ghost: KinematicBody2D = get_node("Ghost")
onready var ghost2: KinematicBody2D = get_node("Ghost2")
onready var interface: CanvasLayer = get_node("Interface")
onready var parallax_background: ParallaxBackground = get_node("ParallaxBackground")
onready var obs_spawner: Position2D = parallax_background.get_node("ObsSpawner")

func _ready() -> void:
	var _start = interface.connect("start_game", self, "start_game")
	var _game_over = bat.connect("game_over", self, "game_over")
	
func start_game() -> void:
	bat.start()
	ghost.start()
	ghost2.start()
	obs_spawner.spawn()
	$music2.play()
	

func game_over() -> void:
	interface.game_over()
	parallax_background.game_over()
	obs_spawner.game_over()
	obs_spawner.queue_free()
	$music2.stop()
	







