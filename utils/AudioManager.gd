extends Node

# Music and audios for all scenes
var is_debugging = true

var game_music = load("res://utils/assets/Take Me Out To The Ballgame - Freedom Trail Studio.mp3")
var beep_audio = load("res://utils/assets/Beeper Emergency Call.mp3")

onready var music_player: AudioStreamPlayer = $MusicPlayer
onready var audio_player: AudioStreamPlayer = $AudioPlayer

func _ready():
	if is_debugging:
		return
		
	play_music()

func play_music():
	music_player.stream = game_music
	music_player.play()

func play_audio(audio_name):
	match audio_name:
		'beep':
			audio_player.stream = beep_audio
			audio_player.play()
		_:
			print('SOUND NOT FOUND')
