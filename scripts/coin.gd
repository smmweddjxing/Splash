extends Area2D

@export var Gold_We_Have=1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name=="Player":
		settings.coin+=Gold_We_Have
		queue_free()
	
