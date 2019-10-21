extends Node2D

var proceed :Semaphore
var waiting :bool
var stepper :Thread
var coins_grabbed :int = 0
var under_coin = null

var coin = preload("res://objects/Coin.tscn")

func _ready():
	waiting = false
	proceed = Semaphore.new()
	stepper = Thread.new()
	stepper .start (self, "execute")

func _exit_tree():
	stepper.wait_to_finish()
	
func turnLeft ():
	waiting = true
	$Luigi.turn_left()
	proceed.wait()
	
func turnRight ():
	waiting = true
	$Luigi.turn_right()
	proceed.wait()

func goForward ():
	var pos = $Luigi.next_forward_position()
	var cx = (pos.x - 16) / 32
	var cy = (pos.y + 8) / 32
	
	if $Stuff.get_cell (cx, cy) != -1:
		return
	
	under_coin = null
	waiting = true
	$Luigi.walk()
	proceed.wait()
	
func jump ():
	waiting = true
	$Luigi.jump()
	proceed.wait()
	
func _on_Luigi_did_operation():
	if waiting:
		proceed.post()
		waiting = false

func _on_Flag_area_entered(area):
	if coins_grabbed < 1:
		$Inform/RichTextLabel.bbcode_text = "You didn't get any coins"
	elif coins_grabbed < 2:
		$Inform/RichTextLabel.bbcode_text = "You got 1 coin"
	else:
		$Inform/RichTextLabel.bbcode_text = "You got " + str(coins_grabbed) + " coins"
		
	$Inform.show()
	pass # Replace with function body.

func _on_Luigi_grabbing():
	if under_coin != null:
		coins_grabbed += 1
		under_coin.queue_free ()
		under_coin = null

func collected (who):
	under_coin = who

func put_luigi_at_cell (cx, cy):
	var x = cx * 32 + 16
	var y = cy * 32 - 8
	print(x, ", ", y)
	$Luigi.position = Vector2(x, y)

func put_coin_at_cell (cx, cy):
	var newcoin = coin.instance()
	var x = cx * 32 + 16
	var y = cy * 32 - 16
	newcoin.position = Vector2(x, y)
	newcoin.listener = self.get_path()
	$Coins.add_child (newcoin)
	
func put_flag_at_cell (cx, cy):
	var x = cx * 32 + 16
	var y = cy * 32 - 32
	$Flag.position = Vector2 (x, y)
	





