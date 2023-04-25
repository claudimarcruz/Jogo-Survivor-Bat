extends Node2D
class_name Obstaculos

onready var top: StaticBody2D = get_node("Top")
onready var center: StaticBody2D = get_node("Center")
onready var bottom: StaticBody2D = get_node("Bottom")
onready var bottom2: StaticBody2D = get_node("Bottom2")
onready var bottom3: StaticBody2D = get_node("Bottom3")

export(int) var walk_speed
var obs_texture

func _ready() -> void:
	obs_texture = top.get_node("Texture").texture 
	obs_texture = center.get_node("Texture").texture 
	obs_texture = bottom.get_node("Texture").texture 
	obs_texture = bottom2.get_node("Texture").texture 
	obs_texture = bottom3.get_node("Texture").texture 

 
func _physics_process(delta: float) -> void:
	position.x -= delta * walk_speed

# Notifier
func _on_screen_exited() -> void:
	queue_free()

#colisão com adaga
func game_over() -> void:
	top.get_node("Collision").set_deferred("disabled", true)
	center.get_node("Collision").set_deferred("disabled", true)
	bottom.get_node("Collision").set_deferred("disabled", true)
	bottom2.get_node("Collision").set_deferred("disabled", true)
	bottom3.get_node("Collision").set_deferred("disabled", true)
	set_physics_process(false)
	
	


func on__body_exited(body: Deimos) -> void:
	if body is Deimos and body.global_position.x > get_node("ScoreArea/Collision1").global_position.x:
		get_tree().call_group("Interface", "update_score")
	


