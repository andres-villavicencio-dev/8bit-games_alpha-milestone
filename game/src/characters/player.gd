extends CharacterBody2D

const SPEED = 80.0

enum Direction { DOWN, UP, LEFT, RIGHT }

var facing: Direction = Direction.DOWN
var is_moving: bool = false

@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * SPEED
		is_moving = true
		_update_facing(direction)
	else:
		velocity = Vector2.ZERO
		is_moving = false

	move_and_slide()

func _update_facing(dir: Vector2) -> void:
	if abs(dir.x) > abs(dir.y):
		facing = Direction.RIGHT if dir.x > 0 else Direction.LEFT
	else:
		facing = Direction.DOWN if dir.y > 0 else Direction.UP