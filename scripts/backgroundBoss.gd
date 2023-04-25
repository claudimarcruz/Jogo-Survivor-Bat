extends Node2D

onready var bat: KinematicBody2D = get_node("Deimos")
onready var enemy: KinematicBody2D = get_node("Enemy")
onready var ghost: KinematicBody2D = get_node("Ghost")
onready var ghost2: KinematicBody2D = get_node("Ghost2")
onready var ghost3: KinematicBody2D = get_node("Ghost3")
onready var ghost4: KinematicBody2D = get_node("Ghost4")
onready var interface2: CanvasLayer = get_node("Interface2")
onready var interfaceFinal: CanvasLayer = get_node("InterfaceFinal")
onready var parallax_background3: ParallaxBackground = get_node("ParallaxBackground3")


func _ready() -> void:
	var _start = interface2.connect("start_game", self, "start_game")
	var _game_over = bat.connect("game_over", self, "game_over")
	
	
func start_game() -> void:
	bat.start()
	enemy.start()
	ghost.start()
	ghost2.start()
	ghost3.start()
	ghost4.start()
	
	

func game_over() -> void:
	interface2.game_over()
	
