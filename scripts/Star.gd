extends Area2D
var pos:int
var man:int=1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.hide()
	pos=position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y>=pos+20:
		man*=-1
	elif position.y<=pos-20:
		man*=-1
	position.y+=0.1*man
		
	


func _on_body_entered(body):
	if body.name=="Player":
		settings.stars+=1
		$Sprite2D.queue_free()
		$CollisionPolygon2D.set_deferred("disabled",0)
		$LabelTimer.start()
		$Label.show()
		man=0


func _on_label_timer_timeout():
	queue_free()
