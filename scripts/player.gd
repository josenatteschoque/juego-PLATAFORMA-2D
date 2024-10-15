extends KinematicBody2D

const moveSpeed = 50
const maxSpeed = 100

const jumpheight = -300
const up = Vector2(0,-1)
const gravity = 15

onready var sprite = $Sprite
onready var animationplayer = $AnimationPlayer

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += gravity 
	var friction = false

	if Input.is_action_pressed("ui_right"):
		 sprite.flip_h = true 
		 animationplayer.play("walk")
		 motion.x = min(motion.x + moveSpeed,maxSpeed)
	
	elif Input.is_action_pressed("ui_left"):
		 sprite.flip_h = false
		 animationplayer.play("walk") 
		 motion.x = max(motion.x - moveSpeed,-maxSpeed)
	
	else:
		 animationplayer.play("idle")
		 friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			 motion.y = jumpheight
		if friction == true:
			motion.x = lerp(motion.x,0,0.5)
	else:
		if friction == true: 
			motion.x = lerp(motion.x,0,0.01)
			
	motion = move_and_slide(motion,up) 
			
			
			
func add_Coin():
	
	var CanvasLayer = get_tree().get_root().find_node("CanvasLayer",true,false);
	
	CanvasLayer.handleCoinCollected()

func _loseLife():
	print("nos hemos pinchados,perdemos vida o reiniciamos el nivel")
	get_tree().reload_current_scene()

##SPIKES DAMAGE
func _on_spikes_body_entered(body):
	if body.get_name() == "player":
		print("nos hemos pinchados")
		get_tree().reload_current_scene()
