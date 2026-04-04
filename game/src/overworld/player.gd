extends CharacterBody2D

const SPEED = 80.0

enum Direction { DOWN, UP, LEFT, RIGHT }

var facing: Direction = Direction.DOWN
var is_moving: bool = false
var dungeon: Node2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var interaction_area: Area2D = $InteractionArea

signal interacted(target: Node)

func _ready() -> void:
	dungeon = get_parent()

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * SPEED
		is_moving = true
		_update_facing(direction)
		_check_door_transition(direction)
	else:
		velocity = Vector2.ZERO
		is_moving = false

	move_and_slide()
	_update_animation()

	if Input.is_action_just_pressed("ui_accept"):
		_try_interact()

func _check_door_transition(dir: Vector2) -> void:
	if not dungeon or not dungeon.has_method("is_at_door"):
		return
	
	var door_dir = ""
	if dir.y < 0:
		door_dir = "north"
	elif dir.y > 0:
		door_dir = "south"
	elif dir.x > 0:
		door_dir = "east"
	elif dir.x < 0:
		door_dir = "west"
	
	if door_dir and dungeon.is_at_door(door_dir):
		dungeon.try_move(door_dir)

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
