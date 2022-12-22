extends Area2D

signal entrouCentral

func _on_CentralPortal_body_entered(body):
	if body.name == "Player":
		emit_signal("entrouCentral",self.name)
