extends CharacterBody2D

const SPEED = 80.0

enum Direction { DOWN, UP, LEFT, RIGHT }

var facing: Direction = Direction.DOWN
var is_moving: bool = false

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var interaction_area: Area2D = $InteractionArea

signal interacted(target: Node)

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
	_update_animation()

	if Input.is_action_just_pressed("ui_accept"):
		_try_interact()

func _update_facing(dir: Vector2) -> void:
	if abs(dir.x) > abs(dir.y):
		facing = Direction.RIGHT if dir.x > 0 else Direction.LEFT
	else:
		facing = Direction.DOWN if dir.y > 0 else Direction.UP

func _update_animation() -> void:
	if not sprite:
		return
	var anim_prefix = "walk_" if is_moving else "idle_"
	var dir_name = ["down", "up", "left", "right"][facing]
	var anim = anim_prefix + dir_name
	if sprite.animation != anim:
		sprite.play(anim)

func _try_interact() -> void:
	for body in interaction_area.get_overlapping_bodies():
		if body.has_method("interact"):
			interacted.emit(body)
			body.interact()
			break
