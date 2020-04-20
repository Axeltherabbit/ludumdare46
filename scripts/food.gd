extends Area2D


onready var soundplayer = get_parent().get_node("./soundplayer")
onready var spawnpoint= get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	soundplayer.get_stream().loop=false

func _on_food_body_entered(body : KinematicBody2D):
	if body.name == "pg":
		body.Hungerbar.value+=randi()%100+100
		body.updatescore(randi()%10+5)
		queue_free()
		spawnpoint.addenemy()
		if not soundplayer.is_playing():
			soundplayer.play()
	
