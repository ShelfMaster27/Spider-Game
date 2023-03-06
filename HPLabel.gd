extends Label



func _on_Player_health_updated(health):
	text =str(health) + "/100"
