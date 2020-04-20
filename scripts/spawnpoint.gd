extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var food = preload("res://scenes/food.tscn")
var enemy = preload("res://scenes/enemy.tscn")

var has_food = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
var time=0
var spawnrate
func _process(delta):
	time+=delta
	if spawnrate < time and not has_food:
		var food_instance= food.instance()
		spawnrate += 5
		food_instance.position=Vector2(randi()%3000-1500,randi()%3000-1500)
		add_child(food_instance)
		has_food=true

func addenemy():
	has_food=false
	var enemy_instance=enemy.instance()
	enemy_instance.position=Vector2(randi()%3000-1500+randi()%100,randi()%3000-1500+randi()%100)
	add_child(enemy_instance)



func _ready():
	spawnrate=3
