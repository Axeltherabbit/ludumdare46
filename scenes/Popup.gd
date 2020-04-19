extends Label

func _input(event):
	if Input.is_key_pressed(KEY_R) and self.is_visible_in_tree():
		get_tree().reload_current_scene()
		get_tree().paused = false
