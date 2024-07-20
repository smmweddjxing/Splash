extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var stars:String="[color=yellow]"
	if not settings.stars_get.is_empty():
		for i in settings.stars:
			if(i>=settings.stars_get.size()):
				break
			stars=stars+settings.stars_get[i]+"\n"
	$"../Label2".text="coin   "+str(settings.coin)

	text=stars+"[/color]"


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
