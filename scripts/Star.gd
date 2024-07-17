extends Area2D
var pos:int
var man:int=1
@export var Star_name:String=""
var not_on_sevice=0
# Called when the node enters the scene tree for the first time.
func _ready():
	#var a=
	
	pos=position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	Performance.add_custom_monitor("Games/starexits",get_pd)
	if get_pd():
		queue_free()
	if position.y>=pos+20:
		man*=-1
	elif position.y<=pos-20:
		man*=-1
	position.y+=0.1*man
		
func get_pd():
		var pd=Star_name in settings.stars_get
		return pd


func _on_body_entered(body):
	if not not_on_sevice:
		if body.name=="Player":
			settings.stars+=1
			var a=settings.stars_get
			a.append(str(Star_name))
			$Sprite2D.hide()
			monitoring=0
			$LabelTimer.start()
			$Label.show()
			$Label.text+="\n"+Star_name
			man=0
			not_on_sevice=1


func _on_label_timer_timeout():
	queue_free()
