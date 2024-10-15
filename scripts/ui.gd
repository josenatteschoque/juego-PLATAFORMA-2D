extends CanvasLayer

var coins = 0

func _ready():
		
	$CoinsCollectedtex.text = String(coins) 
	
func handleCoinCollected():
	print("coin Collected")	
	coins+=1
	$CoinsCollectedtex.text = String(coins)

	if coins==5:
		##cambia a solo 2 niveles 
		##get_tree().change_scene("res://escena/mundo2.tscn")
		
		##cambia todos los niveles
		get_tree().change_scene("res://escena/mundo" + str(int(get_tree().current_scene.name)+1)+".tscn")
		
