extends "res://objects/Basic.gd"


func execute ():


	pass



































func _ready():
	$Luigi.face_east()
	put_luigi_at_cell (10, 9)
	put_coin_at_cell  (16, 4)
	put_coin_at_cell  (16, 14)
	put_flag_at_cell  (10, 15)
	proceed.post()

func main(userdata):
	proceed.wait()
	execute()

