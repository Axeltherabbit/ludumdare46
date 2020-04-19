extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_food_body_entered(body : KinematicBody2D):
	body.Hungerbar.value+=randi()%100+100
	body.updatescore(randi()%10+5)
	queue_free()
