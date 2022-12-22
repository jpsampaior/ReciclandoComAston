extends Node

var tipos_lixo_disponivel = ["papel", "vidro", "metal", "plastico"]
var PortaisLimpos = []
var tipo_atual
var player_x_position = 84
var player_y_position = 116
var TipoMaterial = ""
var pontosGlobais = 0
var portalName
var levelPontos = 0

# Essa função, junto com esse array, são usados para fazer uma filtragem em quais tipos de
# lixo podem ser sorteados quando o player entrar no portal.
# Será randomico mas esse singleton impedirá de seja sorteado o mesmo tipo de lixo mais de 2 vezes.

func get_tipos_lixo_disponivel():
	if (tipos_lixo_disponivel.size()==0):
		tipos_lixo_disponivel = ["papel", "vidro", "metal", "plastico"]
	
	print(tipos_lixo_disponivel)
	return tipos_lixo_disponivel[randi() % tipos_lixo_disponivel.size()]
