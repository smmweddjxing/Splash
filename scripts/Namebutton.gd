extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func rename():
	
	if $LineEdit.visible:
		#submit
		$LineEdit.hide()
		settings.playername=$LineEdit.text
		get_node("../Label").text=settings.playername
		$LineEdit.clear()
	else: $LineEdit.show()
