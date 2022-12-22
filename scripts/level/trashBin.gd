extends KinematicBody2D
signal lixo_coletado
signal lixo_errado
var velocity = Vector2()
var speed = 60

func _on_Boca_body_entered(body):
#	if (global.tipo_atual in body.get_name() and global.levelPontos == 0):
	if(global.tipo_atual in body.get_name()):
		emit_signal("lixo_coletado")
		print("lixo correto")
	else:
		emit_signal("lixo_errado")
	body.queue_free()

func _physics_process(_delta) -> void:
	if Input.is_action_pressed("ui_right"):
		velocity.x = 200

	elif Input.is_action_pressed("ui_left"):	
		velocity.x = -200

	else:
		velocity.x = 0
		
	position.x = clamp(position.x,0,384)

	velocity = velocity.normalized() * 250
	move_and_slide(velocity, Vector2.UP)

	
func _ready():
	Serial.connect("info", self, "move")
	
func move(_xValue,_yValue,iValue):
	velocity.x = -int(iValue) * speed
	velocity = move_and_slide(velocity)
