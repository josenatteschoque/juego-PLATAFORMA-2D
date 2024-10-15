extends Area2D 

signal CoinsCollected

func _on_coin2D_body_entered(body):
	if body.get_name() == "player":	
		body.add_Coin()
		queue_free()
		pass # Replace with function body.
