extends Area2D

var possiveisX = [200, 150, 30]
var possiveisY = [140, 150, 160]
var randomico

func _ready():
	randomize()
	randomico = int(randi() % 3)
	print(randomico)
	position.x = possiveisX[randomico]
	position.y = possiveisY[randomico]


func _on_LixoPapel_body_entered(_body):
	if global.TipoMaterial == "":
		queue_free()
		global.TipoMaterial = "Papel"
		
