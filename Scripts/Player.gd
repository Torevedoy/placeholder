extends CharacterBody2D
class_name Player

@onready var sprite = $amongus


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
var JUMP_MAX = 2
var JUMP_COUNT = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	GameManager.player = self

func _physics_process(delta):
	if Input.is_action_just_pressed("left"):
		sprite.scale.x = abs(sprite.scale.x) * -1
		
	if Input.is_action_just_pressed("right"):
		sprite.scale.x = abs(sprite.scale.x)
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		
	if is_on_floor() and JUMP_COUNT != 0:
		JUMP_COUNT = 0

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and JUMP_COUNT<JUMP_MAX:
		velocity.y = JUMP_VELOCITY
		JUMP_COUNT += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
 
	move_and_slide()
	
	if position.y >= 8:
		die()
	
	
func die():
	GameManager.respawn_player()
	
	
# Example player elimination logic
func player_elimination_logic():
	pass

