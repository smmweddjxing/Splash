extends CharacterBody2D
var hurting=false
signal death

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jumped=false
var deaing=false
var is_killing=false
var kill=0
func  _ready():
	$CollectionTimer.wait_time=2
	settings.is_hurting=false
	$VisbleTimer.timeout.connect(Visble)
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		print("fall now!")
	else :
		is_killing=false
	

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
		jumped=true
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if not jumped and $AnimatedSprite2D.is_playing():$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.flip_h=true
		if not (jumped and $AnimatedSprite2D.is_playing()):$AnimatedSprite2D.play("walk")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	$AnimatedSprite2D.stop()
	print(str($CollectionTimer.time_left)+"     "+str($CollectionTimer.wait_time))
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
		jumped=false
		kill = 0
		print("stand now!")
	
	if not deaing:move_and_slide()


func game_over():
	death.emit()
	position=Vector2(60,7);
	print("dead!")
	deaing=true;
	hide()
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
	print("Time UP")
	$CollectionTimer.stop()
	$VisbleTimer.stop()

func Visble():
	visible=not visible
