extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var foods=[load("res://img/food_0.png"),
		   load("res://img/food_1.png"),
		   load("res://img/food_2.png"),
		   load("res://img/food_3.png"),
		   load("res://img/food_4.png")]

func _ready():
	texture=foods[randi()%len(foods)]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
