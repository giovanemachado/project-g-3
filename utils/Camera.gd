extends Camera2D

var shake_amount = 0
var default_offset = offset
onready var timer = $Timer

func _ready():
	assert(timer != null, "No Timer attached")
	timer.connect("timeout", self, "_on_timer_timeout")
	set_process(false)
	randomize()

func _process(delta):
	offset = Vector2(rand_range(-1, 1) * shake_amount, rand_range(-1, 1) * shake_amount)

func shake(time = 0.20, amount = 2.5):
	timer.wait_time = time
	shake_amount = amount
	set_process(true)
	timer.start()

func _on_timer_timeout():
	set_process(false)
