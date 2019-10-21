extends "res://objects/Basic.gd"

func _ready():
	$Luigi.face_east()
	put_luigi_at_cell (10, 9)
	put_coin_at_cell (15, 12)
	put_flag_at_cell (23, 10)
	

func execute (userdata):
	goForward()
	goForward()
	goForward()
	goForward()
	goForward()
	turnRight()
	goForward()
	goForward()
	goForward()
	jump()
	turnLeft()
	goForward()
	goForward()
	goForward()
	goForward()
	goForward()
	goForward()
	goForward()
	goForward()
	turnLeft()
	goForward()
	goForward()
	goForward()
	goForward()
	pass

