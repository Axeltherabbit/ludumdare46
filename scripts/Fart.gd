extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = $fart_player

var farts=[preload("res://music/fart_0.ogg"),
		   preload("res://music/fart_1.ogg"),
		   preload("res://music/fart_2.ogg"),
		   preload("res://music/fart_3.ogg")]

var farted = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if farted and not is_playing():
		flip_h=!flip_h
		show()
		play()
		var random_n=randi()%len(farts)
		player.stream=farts[random_n]
		farts[random_n].loop=false
		player.play()
		
	if self.get_frame() == 7:
		modulate.a-=0.01
	if modulate.a <=0:
		stop()
		set_frame(0)
		farted=false
		modulate.a=1
		hide()
