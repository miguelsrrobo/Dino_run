extends Area2D

onready var dinossauro = get_parent().get_node("Dinossauro")
var chao = Vector2(1400,743)
var velocidade = Vector2(-500,0)
var tempo_vida = 5
var pulou = false
onready var main = get_parent()

func _ready():
	set_position(chao)
	connect("area_entered", dinossauro, "colidiu")

func _physics_process(delta):
	if not main.comecou:
		return
	set_position(get_position() + get_node("/root/Main").velocidade * delta)
	
	tempo_vida -= delta
	
	if tempo_vida <= 0:
		queue_free()
	
	if not pulou:
		if get_position().x < main.get_node("Dinossauro").get_position().x:
			pulou = true
			main.pontos = main.pontos + main.pontuacao_cacto
			main.get_node("Pontos").text = "Pontos: " + str(main.pontos)
