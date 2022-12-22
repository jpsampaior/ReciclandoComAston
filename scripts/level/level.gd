extends Node2D
var pontos: int = 0
var locais_de_lixo = [125,200,275,350]
const MAX_PONTOS = 2

#Objetos do HUD
onready var TipoPontos = get_node("HUD/TipoPontos")
onready var IntPontos = get_node("HUD/IntPontos")

# Os 4 tipos de lixo 
var tipos_lixo = ["papel", "vidro", "metal", "plastico"] # Esse array é usado para instanciar as cenas
const metalTrash = preload("res://scenes/level/metalTrash.tscn")
const papelTrash = preload("res://scenes/level/papelTrash.tscn")
const plasticoTrash = preload("res://scenes/level/plasticoTrash.tscn")
const vidroTrash = preload("res://scenes/level/vidroTrash.tscn")

func _ready():
	$HUD/maxPontos.text =  "(MAX: %d)" %[MAX_PONTOS]
	randomize()
	global.tipo_atual = global.get_tipos_lixo_disponivel()
	global.tipos_lixo_disponivel.erase(global.tipo_atual)
	print("tipo_atual = " + global.tipo_atual)
	TipoPontos.text = global.tipo_atual.to_upper()
	IntPontos.text = "0"
	$themeMusic.play()
	global.levelPontos = 0
	
func _on_Timer_timeout():
	var lixo_caindo = tipos_lixo[randi() % tipos_lixo.size()]
	
	if (lixo_caindo == "papel"):
		var papel = papelTrash.instance()
		add_child(papel)
		papel.position.y = -25
		papel.position.x = locais_de_lixo[randi() % locais_de_lixo.size()]
		
	if (lixo_caindo == "vidro"):
		var vidro = vidroTrash.instance()
		add_child(vidro)
		vidro.position.y = -25
		vidro.position.x = locais_de_lixo[randi() % locais_de_lixo.size()]
		
	if (lixo_caindo == "metal"):
		var metal = metalTrash.instance()
		add_child(metal)
		metal.position.y = -25
		metal.position.x = locais_de_lixo[randi() % locais_de_lixo.size()]
		
	if (lixo_caindo == "plastico"):
		var plastico = plasticoTrash.instance()
		add_child(plastico)
		plastico.position.y = -25
		plastico.position.x = locais_de_lixo[randi() % locais_de_lixo.size()]

func _on_Area2D_body_entered(body):
	print(body.name)
	body.queue_free()

func _on_Trashbin_lixo_coletado():
	pontos += 1
	$AudioAcertarLixo.play()
	IntPontos.text = String(pontos)
	if (pontos == MAX_PONTOS):
		$Trashbin.queue_free()
		global.levelPontos = 1
		global.pontosGlobais += 1
		var time = 2
		$Tween.interpolate_property($CanvasModulate,"color",
		Color(1,1,1,1),Color(0,0,0,0),time,Tween.TRANS_LINEAR,Tween.EASE_OUT)
		$Tween.start()


func _on_Tween_tween_completed(_object, _key):
	get_tree().change_scene("res://scenes/map/map.tscn")


func _on_Trashbin_lixo_errado():
	$AudioErrarLixo.play()
	if(pontos >0):
		pontos -= 1
		IntPontos.text = String(pontos)
