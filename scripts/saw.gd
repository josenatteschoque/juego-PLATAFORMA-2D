extends Node2D

func _ready():
	$AnimationPlayer.play("rotate saw")
	
func _on_Area2D_body_entered(body):
	if body.get_name() == "player":	 
		body._loseLife()
		pass
