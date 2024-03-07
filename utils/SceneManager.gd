extends CanvasLayer

onready var animation_player: AnimationPlayer = $AnimationPlayer

func scene_transition(scene_name):
	transition_dissolve(scene_name)

func transition_dissolve(target: String) -> void:
	animation_player.play_backwards('dissolve')
	yield(animation_player,'animation_finished')
	get_tree().change_scene(target)
	animation_player.play('dissolve')
