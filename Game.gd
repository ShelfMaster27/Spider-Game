extends Node2D

export (PackedScene) var BiggerSpider


func _ready():
	randomize()

func _on_Spawn_Timer_timeout():
	BiggerSpider = preload("res://Bigger Spider.tscn")
	var new_bigger_spider = BiggerSpider.instance()
	add_child(new_bigger_spider)
	var bigger_spider_location = get_node("Enemy Spider Path/Enemy Spider Spawn Location")
	bigger_spider_location.offset = randi()
	var direction = bigger_spider_location.rotation + PI / 2
	new_bigger_spider.position = bigger_spider_location.position
	new_bigger_spider.visible = true
