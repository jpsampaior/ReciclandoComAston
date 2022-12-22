extends Control

func _physics_process(_delta) -> void:
	if (Input.is_action_just_pressed("ui_accept")):
		get_tree().change_scene("res://scenes/map/map.tscn")

func _ready():
	Serial.connect("btn", self, "btn")

func btn():
	get_tree().change_scene("res://scenes/map/map.tscn")
