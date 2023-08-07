extends CharacterBody2D

var Bonus = 1
const SPEED = 500.0
const JUMP_VELOCITY = -500.0
var PEGOUPOWERUP = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY*Bonus

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_goal_body_entered(body):
	body.queue_free()
	var win = $"../"
	win.register_win()

func _on_go_body_entered(body):
	body.queue_free()
	var win = $"../"
	win.register_lose()


func _on_powerup_body_entered(body):
	if PEGOUPOWERUP == false:
		PEGOUPOWERUP = true
		Bonus = 1.5 # Replace with function body.
		var powerjump = get_node("../Powerup")
		powerjump.queue_free()
	else:
		pass


func _on_bat_body_entered(body):
	body.queue_free()
	var win = $"../"
	win.register_lose()
	
func _on_bat2_body_entered(body):
	body.queue_free()
	var win = $"../"
	win.register_lose()
	
func _on_bat3_body_entered(body):
	body.queue_free()
	var win = $"../"
	win.register_lose()
	
func _on_bat4_body_entered(body):
	body.queue_free()
	var win = $"../"
	win.register_lose()
