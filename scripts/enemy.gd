extends KinematicBody2D


onready var pg=get_node("/root/world/pg")
onready var player = $player

var speed = 100

func _ready():
	player.get_stream().loop=false


func _physics_process(delta):
	var movement = (pg.global_position - global_position).normalized()
	move_and_collide(movement*speed*delta)


func _on_Area2D_body_entered(body: KinematicBody2D):
	if body.name=="pg":
		body.enemyhit()
		if not player.is_playing():
			player.play()
			
