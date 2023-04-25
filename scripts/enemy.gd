extends KinematicBody2D
class_name Enemy

signal game_over

var dano = 0;

var hidden = false

var posicao_inicial
var posicao_final
var velocidade = 8
var direcao = 1                
var dead = false

var life= 100;
# vetor de duas dimensões x e y
var velocity: Vector2
# variável para interagir
var can_interact: bool = true

var cont=0

onready var bat_texture: Sprite = get_node("Texture")
onready var animation: AnimationPlayer = get_node("Animation")

var texture_list

export(int) var gravity_speed
export(int) var jump_speed

const ataque = preload("res://scenes/poderBoss.tscn")

func poderBoss():
	var poder = ataque.instance()
	poder.position = get_global_position()
	
	if(dano >1):
		poder.set_direcao(Vector2.LEFT)
		$poder.play()
		cont = cont +1
		#lincar barra de poder
		print("poder: ", cont)
	
	if(poder.direcao):
		get_parent().add_child(poder)

func _ready() -> void:
	set_texture()
	# enquanto não der play no jogo o personagem fica escondido
	set_physics_process(false)
	
	posicao_inicial = $".".position.y
	posicao_final = posicao_inicial + 500
	
	$LifeBar.percent_visible = false
	$Texture.flip_h = false
	

	# função que faz a seleção do personagem que vai aparecer  
func set_texture() -> void:
	texture_list=bat_texture.texture


func _physics_process(delta) -> void:
	$LifeBar.value = life
	if(dead==false):
	
		if($".".position.y <= posicao_final and direcao==1):
			$".".position.y += velocidade 
		else:
			direcao = 2
		
		if($".".position.y >= posicao_inicial and direcao==2):
			$".".position.y -= velocidade 
		else:
			direcao = 1
	
	if(!get_tree().get_nodes_in_group("ataquesBoss").size() == 1):
		poderBoss()


func start() -> void:
	# dá play na animação
	animation.play("idle2")
	# liga a gravidade e o pulo
	set_physics_process(true)



func _on_DetectionArea_area_entered(area):
	if area.name != "Enemy":
		#spawn_sfx("res://Sons/hit.ogg")
		dano += 1
		print(dano)
		life -=2;
		
		
	if dano == 50:
		can_interact = false
		animation.play("RESET")
		queue_free()
		#animation.play("quedaDeimos")
		emit_signal("game_over")
		
		dano=0
