extends Control
signal try

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	print("I hidden!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	try.emit()
	settings.life=3
	settings.coin-=10
	if settings.coin<=0:
		settings.coin=0
	hide()


func _on_player_death():
	show()

