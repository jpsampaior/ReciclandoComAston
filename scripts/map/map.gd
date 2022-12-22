extends Node2D

var portal

func _ready():
	$ThemeMusic.play()
	$YSort/Player.position.x = global.player_x_position
	$YSort/Player.position.y = global.player_y_position
	$YSort/Player/Camera.limit_left = -55
	$YSort/Player/Camera.limit_top = 0
	$YSort/Player/Camera.limit_right = 935
	$YSort/Player/Camera.limit_bottom = 879
	
	
#	for i in range(global.PortaisLimpos.size()) :
#		global.PortaisLimpos[i].queue_free()

	match global.portalName:
		"Portal1":
			$Portals/Portal1.queue_free()
		"Portal2":
			$Portals/Portal2.queue_free()
			$Portals/Portal1.queue_free()
		"Portal3":
			$Portals/Portal2.queue_free()
			$Portals/Portal1.queue_free()
			$Portals/Portal3.queue_free()
		"Portal4":
			$Portals/Portal2.queue_free()
			$Portals/Portal1.queue_free()
			$Portals/Portal3.queue_free()
			$Portals/Portal4.queue_free()
		"Portal5":
			$Portals/Portal2.queue_free()
			$Portals/Portal1.queue_free()
			$Portals/Portal3.queue_free()
			$Portals/Portal4.queue_free()
			$Portals/Portal5.queue_free()
		"Portal6":
			$Portals/Portal2.queue_free()
			$Portals/Portal1.queue_free()
			$Portals/Portal3.queue_free()
			$Portals/Portal4.queue_free()
			$Portals/Portal5.queue_free()
			$Portals/Portal6.queue_free()
		"CentralPortal":
			$Portals/CentralPortal.queue_free()
			$Portals.queue_free()
			$Terrain/TrashBase.queue_free()
			$YSort/TrashCans.queue_free()
			$HUD.visible = true

func _on_Portal_entrouPortal(name):
	print(name)
	global.player_x_position = $YSort/Player.position.x
	global.player_y_position = $YSort/Player.position.y
	$YSort/Player.speed = 0
	var time = 1
	$Tween.interpolate_property($CanvasModulate,"color",
	Color(1,1,1,1),Color(0,0,0,0),time,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	$Tween.start()
	$PortalMusic.play()
	portal = 1
	global.portalName = name
#	global.PortaisLimpos.append(name)	
#	if name == "Portal1":
#		global.PortaisLimpos.append($Portals/Portal1)	
#	if name == "Portal2":
#		global.PortaisLimpos.append($Portals/Portal2)	
#	if name == "Portal3":
#		global.PortaisLimpos.append($Portals/Portal3)	
#	if name == "Portal4":
#		global.PortaisLimpos.append($Portals/Portal4)	
#	if name == "Portal5":
#		global.PortaisLimpos.append($Portals/Portal5)	
#	if name == "Portal6":
#		global.PortaisLimpos.append($Portals/Portal6)	
	
func _on_CentralPortal_entrouCentral(name):
	if (global.pontosGlobais == 6):
		global.player_x_position = $YSort/Player.position.x
		global.player_y_position = $YSort/Player.position.y
		$YSort/Player.speed = 0
		var time = 1
		$Tween.interpolate_property($CanvasModulate,"color",
		Color(1,1,1,1),Color(0,0,0,0),time,Tween.TRANS_LINEAR,Tween.EASE_OUT)
		$Tween.start()
		$PortalMusic.play()
		portal = 2
		global.portalName = name

func _on_Tween_tween_completed(_object, _key):
	if (portal == 1):
		$YSort/Player.speed = 60
		get_tree().change_scene("res://scenes/level/level.tscn")
		
	if (portal == 2):
		$YSort/Player.speed = 60
		get_tree().change_scene("res://scenes/central/central.tscn")
