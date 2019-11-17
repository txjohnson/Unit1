extends "res://objects/Basic.gd"


func execute (userdata):


	pass






























func _ready():
	$Luigi.face_east()
	put_luigi_at_cell (10, 9)
	put_coin_at_cell (15, 12)
	put_flag_at_cell (23, 10)
	proceed.post()

func main(userdata):
	proceed.wait()
	execute()

