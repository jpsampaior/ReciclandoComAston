extends Area2D

var possiveisX = [300, 350, 40]
var possiveisY = [135,155, 175]
var randomico

func _ready():
	randomize()
	randomico = int(randi() % 3)
	print(randomico)
	position.x = possiveisX[randomico]
	position.y = possiveisY[randomico]

func _on_LixoMetal_body_entered(_body):
	if global.TipoMaterial == "":
		queue_free()
		global.TipoMaterial = "Metal"
		
	

