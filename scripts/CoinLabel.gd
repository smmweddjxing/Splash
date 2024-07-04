extends Label
var yq:int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if  yq!=settings.coin:
		add_theme_color_override("font_color",Color(1,1,0))
		$Timer.start()
	text="Coins    "+str(int(settings.coin))
	yq=settings.coin


func _on_timer_timeout():
	add_theme_color_override("font_color",Color(1,1,1))
	
