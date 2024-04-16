extends Camera2D

var zoomSpd: float = 0.05
var Minzoom: float = 0.001
var Maxzoom: float = 2.0
var dragSen: float = 1.0

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		position -= event.relative * dragSen / zoom
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP: #for zoom in
			zoom += Vector2(zoomSpd, zoomSpd)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN: #for zoom out
			zoom -= Vector2(zoomSpd, zoomSpd)
		zoom = clamp(zoom, Vector2(Minzoom, Minzoom), Vector2(Maxzoom, Maxzoom)) #limits zoom
