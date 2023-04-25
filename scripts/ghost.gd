extends KinematicBody2D
class_name Ghost

signal game_over

var dano = 0;

var hidden = false

var posicao_inicial
var posicao_final
var posicao_inicial2
var posicao_final2
var velocidade = 5.5
var direcao = 1                #1 - esquerda->direita / 
var dead = false

var life= 100;
# vetor de duas dimensões x e y
var velocity: Vector2
# variável para interagir
var can_interact: bool = true

onready var bat_texture: Sprite = get_node("Texture")
onready var animation: AnimationPlayer = get_node("Animation")
var texture_list
export(PackedScene) var sfx_scene
export(int) var gravity_speed
export(int) var jump_speed

func _ready() -> void:
	set_texture()
	# enquanto não der play no jogo o personagem fica escondido
	set_physics_process(false)
	
	posicao_inicial = $".".position.y
	posicao_final = posicao_inicial + 220
	
	posicao_inicial2 = $".".position.x
	posicao_final2 = posicao_inicial2 + 220
	
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
		elif($".".position.y >= posicao_inicial and direcao==2):
			$".".position.y -= velocidade
		elif($".".position.x >= posicao_inicial2 and direcao==3):
			$".".position.x -= velocidade
		elif($".".position.x <= posicao_final2 and direcao==4):
			$".".position.x += velocidade
		else:
			randomize()
			var sentido: int = randi() % 4 + 1
			#print(sentido)
			direcao=sentido
		
			
		
func start() -> void:
	set_physics_process(true)


		
func spawn_sfx(effect: String) -> void:
	var sfx: SoundEffect = sfx_scene.instance()    
	sfx.stream = load(effect)
	get_tree().root.call_deferred("add_child", sfx)
	


func _on_DetectionArea_area_entered(area):
	if area.name != "Ghost":
		dano += 1
		print(dano)
		life -=25;
		
		
	if dano == 4:
		can_interact = false
		queue_free()
		dano=0
		
	
