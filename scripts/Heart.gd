extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name=="Player":
		if settings.life+1<=settings.max_life:
			settings.life+=1
		else:
			settings.coin+=5
		queue_free()
