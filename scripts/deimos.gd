extends KinematicBody2D
class_name Deimos

signal game_over

var dano = 0;

var cont = 0;

var hidden = false

var life= 100;

var magic=100;

const UP = Vector2(0, -1)

# vetor de duas dimensões x e y
var velocity: Vector2
# variável para interagir
var can_interact: bool = true


onready var bat_texture: Sprite = get_node("Texture")
onready var animation: AnimationPlayer = get_node("Animation")



# carregar imagens diferentes
var texture_list
export(PackedScene) var sfx_scene
export(int) var gravity_speed
export(int) var jump_speed

const ataque = preload("res://scenes/poder.tscn")

func poderDeimos(var sentido):
	var poder = ataque.instance()
	poder.position = get_global_position()
	if(Input.is_action_just_pressed("ataque")):
		poder.set_direcao(sentido)
		spawn_sfx("res://Sons/Low_Health.wav")
		cont = cont +1
		#lincar barra de poder
		print("poder: ", cont)
		magic-=20
	
		
	if(poder.direcao):
		get_parent().add_child(poder)

func _ready() -> void:
	set_texture()
	# enquanto não der play no jogo o personagem fica escondido
	set_physics_process(false)
	
	$LifeBar.percent_visible = false
	$magicBar.percent_visible = false
	$Texture.flip_h = false
	

	# função que faz a seleção do personagem que vai aparecer  
func set_texture() -> void:
	texture_list=bat_texture.texture


func _physics_process(delta) -> void:
	$LifeBar.value = life
	$magicBar.value = magic
	
	if Input.is_action_pressed("ui_right") and can_interact:
		velocity.x = 250
		$Texture.flip_h = false
		
	
	elif Input.is_action_pressed("ui_left") and can_interact:
		velocity.x = -250
		$Texture.flip_h = true
	
	elif Input.is_action_pressed("ui_up") and can_interact:
		velocity.y = -250
		
	
	elif Input.is_action_pressed("ui_down") and can_interact:
		velocity.y = +250
		
	
	else:
		velocity.x=0
		velocity.y=0
		
		
	#poder
	if(!get_tree().get_nodes_in_group("ataques").size() == 5):
		if ($Texture.flip_h == false and magic!=0):
			poderDeimos(Vector2.RIGHT)
		
		elif ($Texture.flip_h == true and magic!=0):
			poderDeimos(Vector2.LEFT)
	
		elif magic==0:
			magic+=100
					
	velocity = move_and_slide(velocity, UP)
	

func start() -> void:
	# dá play na animação
	animation.play("idle2")
	# liga a gravidade e o pulo
	set_physics_process(true)


		
func spawn_sfx(effect: String) -> void:
	var sfx: SoundEffect = sfx_scene.instance()    
	sfx.stream = load(effect)
	get_tree().root.call_deferred("add_child", sfx)
	
	

func _on_DetectionArea_area_entered(area):
	if area.name != "Deimos":
		spawn_sfx("res://Sons/Bump.wav")
		dano += 1
		#print(dano)
		life -=10;
		
	
	if dano == 10:
		velocity.x =0
		velocity.y =0
		can_interact = false
		spawn_sfx("res://Sons/Evil_Laugh.wav")
		animation.play("RESET")
		queue_free()
		#animation.play("quedaDeimos")
		emit_signal("game_over")
		
		dano=0
	




