extends Sprite
export var color = "blu"
export var xVel = 0
export var yVel = 0
export var patrolling = false
export var yPatrol = [0,1080]
export var xPatrol = [0,1920]
var anybody = null


func _process(delta):
	if color == "black":
		anybody = null
	if anybody != null:
		anybody.checkHit(color)
	position.x += xVel * delta
	position.y += yVel * delta
	if patrolling:
		patrol()

func _on_Area2D_body_entered(body):
	anybody = body
	if body.getColor() == color:
		pass
	else:
		body.getHit()
		Global.test+=1

func patrol():
	if position.x >= xPatrol[1] or position.x <= xPatrol[0]:
		xVel *= -1
	if position.y >= yPatrol[1] or position.y <= yPatrol[0]:
		yVel *= -1

func _on_Area2D_body_exited(body):
	anybody = null
	

