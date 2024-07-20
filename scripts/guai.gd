extends CharacterBody2D
signal hit
const SPEED = 40.0
const JUMP_VELOCITY = -400.0
#dexport var sell=true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var v=Vector2.ZERO
var f
var dropping=false
var k=1
func _ready():
	$AnimatedSprite2D.play("walk")

func _physics_process(delta):

	if not is_on_floor():
		velocity.y+=gravity*delta
	velocity.x=-SPEED
	if is_on_wall():
		k*=-1
	velocity.x*=k
	if not settings.is_Dialog:
		move_and_slide()
		f = get_last_slide_collision()

		#Colletion Start
		if f:
			if f.get_collider().name=="Player":
				if not settings.is_hurting:
					hit.emit()	
		#Collection End
	else:
		$AnimatedSprite2D.stop()
	if position.y>270:
		free()
