extends Label

var yq:int
# Called when the node enters the scene tree for the first time.
func _ready():
	yq=settings.coin


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if yq!=settings.life:
		add_theme_color_override("font_color",Color.RED)
		$Timer.start()
	
	
	yq=settings.life
	if  settings.life==1:
		add_theme_color_override("font_color",Color.RED)
		text="LIFE!    "+str(int(settings.life))+"/"+str(int(settings.max_life))
	else:
		text="LIFE    "+str(int(settings.life))+"/"+str(int(settings.max_life))
		add_theme_color_override("font_color",Color.WHITE)
	if settings.life>settings.max_life:
		settings.life=settings.max_life
func hanyuan():
	add_theme_color_override("font_color",Color.WHITE)
