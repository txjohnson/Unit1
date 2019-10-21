extends Node2D

signal did_operation
signal grabbing

enum Direction { North, East, South, West }

var walk_anims = ["WalkUp", "WalkRight", "WalkDown", "WalkLeft"]
var jump_anims = ["JumpUp", "JumpRight", "JumpDown", "JumpLeft"]
var move_vecs  = [Vector2(0, -1), Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0)]


var dir_base_offsets = [36, 24, 0, 12]

var direction :int

export var walk_distance :int = 32
var to_go :int = 0
var was_moving :bool
var was_jumping :bool

func _ready():
	pass

func _process(delta):
	if to_go > 0:
		position += move_vecs [direction]
		to_go -= 1
	elif was_moving:
		was_moving = false
		face (direction)
	
func next_forward_position ():
	var vec = move_vecs [direction]
	return position + Vector2(vec.x * walk_distance, vec.y * walk_distance)

func face (adirection):
	var base = dir_base_offsets [adirection]
	$Sprite.frame = base + 1
	direction = adirection
	$Sprite/AnimationPlayer.stop()
	emit_signal("did_operation")
		
func face_north ():
	face (Direction.North)
	
func face_south ():
	face (Direction.South)
	
func face_east ():
	face (Direction.East)
	
func face_west ():
	face (Direction.West)

func turn_left():
	direction -= 1
	if direction < 0:
		direction = 3
		
	face (direction)
	
func turn_right ():
	direction += 1
	if direction > 3:
		direction = 0
		
	face (direction)
	
func walk ():
	was_moving = true
	to_go =  walk_distance 
	$Sprite/AnimationPlayer.play(walk_anims [direction])
	
func jump ():
	was_jumping = true
	$Sprite/AnimationPlayer.play(jump_anims [direction])

func make_grab ():
	emit_signal("grabbing")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if was_jumping:
		emit_signal("did_operation")
		was_jumping = false
