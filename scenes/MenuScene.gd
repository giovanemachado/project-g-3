extends Node


func _on_Play_pressed():
	SceneLoader.scene_transition(Globals.SCENES.GAME)

