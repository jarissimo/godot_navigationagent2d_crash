extends CharacterBody2D

@onready var _navagent: NavigationAgent2D = $NavigationAgent2d
@onready var _nav_line: Line2D = get_tree().get_first_node_in_group('nav_line')
var speed: int = 250


func _ready():
	_navagent.set_target_location(global_position)


func _physics_process(_delta):
	if not _navagent.is_navigation_finished():
		var next_location = _navagent.get_next_location()
		var direction = global_position.direction_to(next_location)
		_navagent.set_velocity(direction * speed)


func _process(_delta):
	if Input.is_action_just_pressed("move"):
		var target: Vector2 = get_global_mouse_position()
		_navagent.set_target_location(target)
		_navagent.get_next_location()
		_nav_line.points = _navagent.get_nav_path()

func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()
