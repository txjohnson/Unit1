extends "res://objects/Basic.gd"

func _ready():
	$Luigi.face_east()
	put_luigi_at_cell (10, 9)
	put_coin_at_cell  (16, 4)
	put_coin_at_cell  (16, 14)
	put_flag_at_cell  (16, 9)
	

func execute (userdata):

	pass
