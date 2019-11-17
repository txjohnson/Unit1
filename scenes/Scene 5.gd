extends "res://objects/Basic.gd"


func execute ():

	pass




































func _ready():
	$Luigi.face_east()
	put_luigi_at_cell (2, 2)
	put_coin_at_cell  (7, 15)
	put_coin_at_cell  (16, 9)
	put_coin_at_cell  (22, 9)
	put_flag_at_cell  (17, 16)
	proceed.post()

func main():
	proceed.wait()
	execute()

