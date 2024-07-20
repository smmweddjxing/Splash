extends CharacterBody2D
var hurting=false
#signal death

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var deaing=false
var is_killing=false
var kill=0
func  _ready():
	print("XingGame \nDev Edtion Ver 1.3.1 Index\nIt is not for public!")
	$CollectionTimer.wait_time=2
	settings.is_hurting=false
	settings.read()
	position=settings.relive
	$VisbleTimer.timeout.connect(Visble)
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else :
		is_killing=false
	

	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
		#$AnimatedSprite2D.play("jump")
		#jumped=true
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
		#
		#if not jumped and $AnimatedSprite2D.is_playing():$AnimatedSprite2D.play("walk")
	#else:
		#$AnimatedSprite2D.flip_h=true
		#if not (jumped and $AnimatedSprite2D.is_playing()):$AnimatedSprite2D.play("walk")
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	#$AnimatedSprite2D.stop()
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y=JUMP_VELOCITY
		$AnimatedSprite2D.animation="jump"
	var k=Input.get_axis("ui_left","ui_right")#right-left
	if k>0:
		velocity.x=SPEED
	elif k<0:
		velocity.x=-SPEED
	else:
		velocity.x=0
	if velocity.x!=0:
		$AnimatedSprite2D.animation="walk"
		$AnimatedSprite2D.flip_h=velocity.x>0
	if velocity!=Vector2.ZERO:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.play("stand")
	var collect=get_last_slide_collision()
	if collect:
		if collect.get_collider().is_in_group("guai"):
			if Vector2.UP.dot(collect.get_normal())>0.1:
				var guai=collect.get_collider()
				kill+=1
				is_killing=true
				get_parent().get_node("Score it").showing_and_change(kill,guai.position)
				
				
				guai.free()
				if Input.is_action_pressed("ui_accept"):
					velocity.y=-500
				elif Input.is_action_just_pressed("ui_down"):
					pass
				else:velocity.y=-300
	if is_on_floor() and not is_killing:
		kill = 0
	
	if not deaing and not settings.is_Dialog:move_and_slide()
	else: $AnimatedSprite2D.play("stand")


func game_over():
	get_tree().change_scene_to_file("res://scenes/UI.tscn")
func drop(body):
	game_over()


func _on_lose_time_try():
	position=Vector2(-51,7);
	deaing=false
	show()


func hit():

	settings.life-=1
	$CollectionTimer.start()
	$VisbleTimer.start()
	visible=0
	settings.is_hurting=true
	if settings.life==0:
		game_over()


func hurtover():
	visible=1
	settings.is_hurting=false
	$CollectionTimer.stop()
	$VisbleTimer.stop()

func Visble():
	visible=not visible
