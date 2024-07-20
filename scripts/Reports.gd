extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $TextEdit.text=="":
		text="No text"
		disabled=1
	else:
		text="submit and report"
		disabled=0
		


func _on_pressed():
	$TextEdit.clear()
	$"../Label".text="thank you!"
	$Timer.start(
	)
	await  $Timer.timeout
	$"../Label".text="give report"
