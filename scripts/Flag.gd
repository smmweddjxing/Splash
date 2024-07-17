extends Area2D
var is_checked:bool=1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Animation.play("unclear")
	settings.read()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_saved(body):
	if body.name=="Player":
		if is_checked:
			settings.coin+=3
			settings.life=settings.max_life
			$Animation.play("clear")
			is_checked=0
		settings.save()
		$Label.show()
		$Timer.start()
		await  $Timer.timeout
		$Label.hide()
	
