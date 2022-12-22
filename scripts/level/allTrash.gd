extends Node
var animations = ["1", "2", "3", "4"]

func _ready():
	$AnimatedSprite.animation = animations[randi() % animations.size()]
