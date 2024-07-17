extends Control
signal try
var p=0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Rich.text="                    [color=[yellow]another choice[/color]\ndelete my save file\n[b]but it is [color=red]danger!!![/color][/b]"
	print("I hidden!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	
	settings.life=3
	settings.coin-=10
	if settings.coin<=0:
		settings.coin=0
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_player_death():
	show()



func delete_save():
	if p==0:
		$Rich.text="[color=red]really!it is very danger![/color]"
		$Button2.text="i do not want it!"
		p+=1
	else:
		settings.init()
		settings.save()
		_on_button_pressed()
