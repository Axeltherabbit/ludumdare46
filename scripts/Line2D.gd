extends Line2D

onready var pg = get_node("/root/world/pg")
onready var sprite = get_node("./../food_sprite")

func _process(delta):
	var from =to_local(sprite.get_global_position())
	var to = to_local(pg.get_global_position())
	self.points=[from,to]
