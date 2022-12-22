extends Area2D


var possiveisX = [230, 50, 370]
var possiveisY = [145, 165, 120]
var randomico

func _ready():
	randomize()
	randomico = int(randi() % 3)
	print(randomico)
	position.x = possiveisX[randomico]
	position.y = possiveisY[randomico]


func _on_LixoVidro_body_entered(_body):
	if global.TipoMaterial == "":
		queue_free()
		global.TipoMaterial = "Vidro"
