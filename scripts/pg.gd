extends KinematicBody2D


var movement=Vector2()
var speed
var score
onready var World = get_parent()
onready var Label_Score = $Label_score
onready var Label_pop = $Label_pop
onready var Hungerbar = $Hungerbar
onready var Fart = $Fart
onready var maxhunger=Hungerbar.max_value
onready var viewsize = get_viewport().size
onready var pow_viewsize_y=pow(viewsize.y/2,2)
onready var radius = viewsize.y/2


var bodytextures= [preload("res://img/body_0.png"),
				   preload("res://img/body_1.png"),
				   preload("res://img/body_2.png"),
				   preload("res://img/body_3.png"),
				   preload("res://img/body_4.png"),
				   preload("res://img/body_5.png"),]
var arrowtexture =preload("res://img/arrow.png")

func enemyhit():
	print("hit")
	Hungerbar.value-=150

func fart():
	Fart.farted=true
	Hungerbar.value-=25

onready var fat_rate = maxhunger/(len(bodytextures)-1)
var fatspriteindex=0
func updatefat():
	var n=int(Hungerbar.value/fat_rate)
	if n!= fatspriteindex:
		$body.texture= bodytextures[n]
		fatspriteindex=n
	

func updatescore(amount):
	score+=amount
	Label_Score.set_text(str(score))

var red = Color8(255,0,0,255)
var rad45 = deg2rad(45)
var rad90 = deg2rad(90)
func circleintersectionpoint(dist: Vector2,from: Vector2):
	var alpha = atan2(dist.x,dist.y)
	var adj
	var opp
		
	if alpha > rad45:
		alpha = rad90-alpha
		adj=cos(alpha)*radius
		opp=sin(alpha)*radius
	else:
		adj=sin(alpha)*radius
		opp=cos(alpha)*radius
		
	return Vector2(from.x-adj,from.y-opp)	

func _draw():
	for child in World.get_children():
		#loops on World's children with a food child only
		if child.has_node("./food"):
			var food = child.get_node("./food")
			var from =to_local(position)
			var to = to_local(food.get_global_position())
			var dist=Vector2((from.x-to.x),(from.y-to.y))
			
			if  pow(dist.x,2)+pow(dist.y,2) > pow_viewsize_y:
				var point=circleintersectionpoint(dist,from)
				draw_texture(arrowtexture,point)

func _input(event):
	movement=Vector2()
	movement.x+= int(Input.is_key_pressed(KEY_D))-int(Input.is_key_pressed(KEY_A))
	movement.y+= int(Input.is_key_pressed(KEY_S))-int(Input.is_key_pressed(KEY_W))
	movement=movement.normalized()
	if Input.is_key_pressed(KEY_SPACE):
		fart()

var restarttext="\n\n\n\n\n\n\n\nPress R to restart"	
func _process(delta):
	update()
	updatefat()
	if Hungerbar.value == 0:
		Label_pop.set_text("You died of starvation\nScore : "+Label_Score.text+restarttext)
		Label_pop.show()
		get_tree().paused = true
	elif Hungerbar.value == maxhunger:
		Label_pop.set_text("You died of obesity\nScore : "+Label_Score.text+restarttext)
		Label_pop.show()
		get_tree().paused = true	
	
func _physics_process(delta):
	speed = maxhunger-Hungerbar.value
	var collisions=move_and_collide(delta*speed*movement)
	

func _ready():
	score = 0
	updatescore(0)
	get_tree().paused = false
