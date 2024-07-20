extends Button

@onready var World:PackedScene=preload("res://scenes/world.tscn")
@onready var time=$Loadingtimer
# Called when the node enters the scene tree for the first time.
func _ready():
	time.wait_time=randf_range(0.5,5.3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func StartGame():
	time.start()
	text="loading..."
	set_deferred("disabled",1)
	await time.timeout
	get_tree().change_scene_to_packed(World)
