extends Label

var yq:int
# Called when the node enters the scene tree for the first time.
func _ready():
	yq=settings.stars


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if yq!=settings.stars:
		add_theme_color_override("font_color",Color.BURLYWOOD)
		$Timer.start()
	yq=settings.stars
	text="diamond    "+str(settings.stars)
func hanyuan():
	add_theme_color_override("font_color",Color.WHITE)
