extends Control

var sce=["Good","Great","Nice","Excellent","Incredible","Marvellous"]
var clr=[Color.WHITE,Color.AQUA,Color.YELLOW,Color.GOLD,Color.BLUE_VIOLET,Color.INDIGO]

func showing_and_change(serial,pos):
	position=pos
	show()
	$Label.show()
	if serial>5:
		$Label.text=sce[5]
		$Label.add_theme_color_override("font_color",clr[6-1])
	else: 
		$Label.text=sce[serial-1]
		$Label.add_theme_color_override("font_color",clr[serial-1])
	settings.coin+=pow(2,serial-1)
	$Timer2.start()
	for i in range(500):
		position.y-=1
		print()
		await  $Timer2.timeout
	$Label.hide()
func _ready():
	$Label.hide()
