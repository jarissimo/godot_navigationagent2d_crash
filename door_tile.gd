extends Area2D


@onready var _nav_region = $NavigationRegion2d
@onready var _poly = $Polygon2d


func _process(_delta):
	if Input.is_action_just_pressed("toggle_door"):
		_nav_region.enabled = !_nav_region.enabled
		if _nav_region.enabled:
			_poly.color = Color.GREEN
		else:
			_poly.color = Color.RED
