extends CharacterBody2D
@export var Time_line_path:String="res://DG_resourse/Timelines/tl_1.dtl"
@onready var default_timeline=load(Time_line_path)

const SPEED = 30
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_dialog=false
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("dialog") and can_dialog and not settings.is_Dialog:
		settings.is_Dialog=true
		Dialogic.start(default_timeline)
		await Dialogic.timeline_ended
		settings.is_Dialog=false
	var k=randi_range(0,2)
	if k==0:
		velocity.x+=SPEED
	elif k==1:
		velocity.x-=SPEED
	elif k==2:
		velocity.x=0
	if velocity.x:
		if not settings.is_Dialog:$AnimatedSprite2D.animation="walk"
		$AnimatedSprite2D.flip_h=abs(k-1)
	else:
		if not settings.is_Dialog:$AnimatedSprite2D.animation="stand"
	if not settings.is_Dialog:
		move_and_slide()
		$AnimatedSprite2D.play()
	else :$AnimatedSprite2D.stop()



func show_label(body):
	if body.name=="Player":
		$ShowTipArea/Label.show()
		can_dialog=true


func hide_label(body):
	if body.name=="Player":
		$ShowTipArea/Label.hide()
		can_dialog=false
