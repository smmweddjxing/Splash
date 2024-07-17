extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#add jianshi
	Performance.add_custom_monitor("game/stars",get_stars_size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		$Player/PauseMenu.show_menu()
		$Coins.hide()
		$guais.hide()
		$Player/UI.hide()
		$Player/AnimatedSprite2D.hide()
	if not get_tree().paused:
		$Coins.show()
		$guais.show()
		$Player/UI.show()
		$Player/AnimatedSprite2D.show()

func get_stars_size():
	return settings.stars_get.size()
