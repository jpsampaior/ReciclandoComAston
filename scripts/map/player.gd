extends KinematicBody2D

var velocity: Vector2

export(int) var speed

func _physics_process(_delta: float) -> void:
	move()
	animate()
	verifyDirection()


func move() -> void:
	var directionVector: Vector2 = Vector2 (
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	velocity = directionVector * speed
	velocity = move_and_slide(velocity)

func _ready():
	Serial.connect("info", self, "moveJoystick")

func moveJoystick(xValue,yValue,_iValue):
	var directionVector: Vector2 = Vector2 (
		int(xValue),
		int(yValue)
	).normalized()

	velocity = directionVector * speed
	velocity = move_and_slide(velocity)

	animate()
	verifyDirection()

func animate() -> void:
	if velocity != Vector2.ZERO:
		$PlayerAnimation.play("walk")
	else:
		$PlayerAnimation.play("idle")

func verifyDirection() -> void:
	if velocity.x < 0:
		$PlayerAnimation.flip_h = true
	elif velocity.x > 0:
		$PlayerAnimation.flip_h = false
