extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var food = preload("res://scenes/food.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
var time=0
var spawnrate
func _process(delta):
	time+=delta
	if spawnrate < time and len(get_children()) == 0:
		spawnrate += 5
		self.position=Vector2(randi()%3000-1500,randi()%3000-1500)
		add_child(food.instance())

func _ready():
	spawnrate=3
