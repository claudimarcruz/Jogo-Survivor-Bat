extends Node2D

onready var bat: KinematicBody2D = get_node("Deimos")
onready var ghost: KinematicBody2D = get_node("Ghost")
onready var ghost2: KinematicBody2D = get_node("Ghost2")
onready var ghost3: KinematicBody2D = get_node("Ghost3")
onready var ghost4: KinematicBody2D = get_node("Ghost4")
onready var ghost5: KinematicBody2D = get_node("Ghost5")
onready var ghost6: KinematicBody2D = get_node("Ghost6")
onready var ghost7: KinematicBody2D = get_node("Ghost7")
onready var ghost8: KinematicBody2D = get_node("Ghost8")
onready var ghost9: KinematicBody2D = get_node("Ghost9")
onready var ghost10: KinematicBody2D = get_node("Ghost10")
onready var ghost11: KinematicBody2D = get_node("Ghost11")
onready var ghost12: KinematicBody2D = get_node("Ghost12")
onready var ghost13: KinematicBody2D = get_node("Ghost13")
onready var ghost14: KinematicBody2D = get_node("Ghost14")
onready var ghost15: KinematicBody2D = get_node("Ghost15")
onready var ghost16: KinematicBody2D = get_node("Ghost16")
onready var ghost17: KinematicBody2D = get_node("Ghost17")
onready var ghost18: KinematicBody2D = get_node("Ghost18")
onready var ghost19: KinematicBody2D = get_node("Ghost19")
onready var ghost20: KinematicBody2D = get_node("Ghost20")
onready var ghost21: KinematicBody2D = get_node("Ghost21")
onready var interface3: CanvasLayer = get_node("Interface3")
onready var parallax_background2: ParallaxBackground = get_node("ParallaxBackground2")


func _ready() -> void:
	var _start = interface3.connect("start_game", self, "start_game")
	var _game_over = bat.connect("game_over", self, "game_over")
	

func start_game() -> void:
	bat.start()
	ghost.start()
	ghost2.start()
	ghost3.start()
	ghost4.start()
	ghost5.start()
	ghost6.start()
	ghost7.start()
	ghost8.start()
	ghost9.start()
	ghost10.start()
	ghost11.start()
	ghost12.start()
	ghost13.start()
	ghost14.start()
	ghost15.start()
	ghost16.start()
	ghost17.start()
	ghost18.start()
	ghost19.start()
	ghost20.start()
	ghost21.start()
	
	

func game_over() -> void:
	interface3.game_over()
	



