extends Control
var timing = true
var test = 0
var timeSec = 0.0
onready var lab = $CanvasLayer/Label

func _process(delta):
	if timing:
		timeSec += delta
		updateTimer()

func updateTimer():
	var minutes = int(timeSec / 60)
	var seconds = int(timeSec) % 60
	var mili = int( fmod(timeSec,1.0)*100 )
	var t = [minutes,seconds,mili]
	var s = ["","",""]
	for x in range(0,3):
		var curr = t[x]
		if curr < 10:
			s[x] = "0" + str(curr)
		else:
			s[x] = str(curr)
	lab.text = "%2s:%2s:%2s" % s
	

static func lerp_angle(from, to, weight):
    return from + short_angle_dist(from, to) * weight

static func short_angle_dist(from, to):
    var max_angle = PI * 2
    var difference = fmod(to - from, max_angle)
    return fmod(2 * difference, max_angle) - difference


