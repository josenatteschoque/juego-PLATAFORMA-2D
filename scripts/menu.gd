extends Control

func _ready():
	$VBoxContainer/startgameButton.grab_focus()


func _on_startgameButton_pressed():
	get_tree().change_scene("res://escena/mundo.tscn")


func _on_quitButton_pressed():
	get_tree().quit()
