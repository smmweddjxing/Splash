extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var a=0
func _on_pressed():
	if a==0:
		text = "I know it is danger\n but i will still do it \n 20 seconds to think."
		$Timer.start()
		a+=1
		await $Timer.timeout
		a=0
		text = "delete saving (danger!)"
		return
	settings.init()
	settings.save()
	get_tree().quit()
