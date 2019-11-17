extends "res://objects/Basic.gd"


func execute ():

	pass




























func _ready():
	$Luigi.face_east()
	put_luigi_at_cell (10, 10)
	put_coin_at_cell (11, 10)
	put_flag_at_cell (16, 10)
	proceed.post()

func main(userdata):
	proceed.wait()
	execute()

