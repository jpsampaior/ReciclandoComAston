extends Node2D

var pontos: int = 0

var TipoMaterial = ""

onready var spriteMaterial = get_node("HUD/Holder/spriteMaterial")

onready var quantidadePontos = get_node("HUD2/Holder2/lblQtdPontos")

func _ready():
	randomize()
	$AudioFundo.play()
	quantidadePontos.text = String(pontos)+"/4"
	$Player/Camera.limit_left = 0
	$Player/Camera.limit_top = 0
	$Player/Camera.limit_right = 384
	$Player/Camera.limit_bottom = 192
	
	
func checar() -> void:
	if(pontos == 4):
		var time = 2
		$Tween.interpolate_property($CanvasModulate,"color",
		Color(1,1,1,1),Color(0,0,0,0),time,Tween.TRANS_LINEAR,Tween.EASE_OUT)
		$Tween.start()
		

func verifyBody(kind,scene,sizeX,sizeY):
	if TipoMaterial == "":
		TipoMaterial = str(kind)
		spriteMaterial.texture = load(str(scene))
		spriteMaterial.rect_size.x = float(sizeX)
		spriteMaterial.rect_size.y = float(sizeY)
		
func verifyCarpet(kind):
	if TipoMaterial == str(kind):
		$AudioAcertarTapete.play()
		TipoMaterial = ""
		pontos+=1
		spriteMaterial.texture = load("")
		global.TipoMaterial = ""
		quantidadePontos.text = String(pontos)+"/4"
		checar()
	if TipoMaterial != str(kind) and TipoMaterial != "":
		resetPosition()
	
func resetPosition():
	$Player.position.x = 184.5
	$Player.position.y = 166
	$AudioPegarLixo.play()
		
func _on_LixoMetal_body_entered(_body):
	verifyBody("Metal","res://assets//Desafio/metal/metal03.tres",18/2,34/2)

func _on_LixoPapel_body_entered(_body):
	verifyBody("Papel","res://assets/Desafio/papel/papel02.tres",53/2,28/2)
		
func _on_LixoPlastico_body_entered(_body):
	verifyBody("Plástico","res://assets/Desafio/plastico/plastico01.tres",15/2,45/2)
		
func _on_LixoVidro_body_entered(_body):
	verifyBody("Vidro","res://assets/Desafio/vidro/vidro02.tres",23/2,35/2)
	
	
func _on_TapetePapel_body_entered(_body):
	verifyCarpet("Papel")	
	
func _on_TapetePlastico_body_entered(_body):
	verifyCarpet("Plástico")
	
func _on_TapeteMetal_body_entered(_body):
	verifyCarpet("Metal")
	
func _on_TapeteVidro_body_entered(_body):
	verifyCarpet("Vidro")

func _on_Tween_tween_completed(_object, _key):
	global.player_x_position = 84
	global.player_y_position = 116
	get_tree().change_scene("res://scenes/map/map.tscn")
