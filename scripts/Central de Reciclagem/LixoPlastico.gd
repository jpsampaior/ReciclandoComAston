extends Area2D

var possiveisX = [125, 80, 280]
var possiveisY = [130, 150, 170]
var randomico

func _ready():
	randomize()
	randomico = int(randi() % 3)
	print(randomico)
	position.x = possiveisX[0]
	position.y = possiveisY[0]


func _on_LixoPlastico_body_entered(_body):
	if global.TipoMaterial == "":
		queue_free()
		global.TipoMaterial = "Plastico"
