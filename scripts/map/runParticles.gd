extends AnimatedSprite

func playParticles() -> void:
	play()
	
func _on_animation_finished() -> void:
	queue_free()
