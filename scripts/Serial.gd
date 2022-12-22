extends Node

const serial_res = preload("res://bin/gdserial.gdns")
onready var serial_port = serial_res.new()

var is_port_open = false
var text = ""

signal info(xValue, yValue, iValue)
signal btn()


func _ready():
	open()


func _exit_tree():
	close()


func open():
	is_port_open = serial_port.open_port("COM6", 115200)
	print(is_port_open)


func write(text):
	serial_port.write_text(text)


func close():
	is_port_open = false
	serial_port.close_port()


func _process(_delta):
	if is_port_open:
		var t = serial_port.read_text()
		
		if t.length() > 0:
			for c in t:
				if c == "\n":
					on_text_received(text)
					text = ""
				else:
					text+=c
		

func on_text_received(text):
	
	var command_array = text.split(" ")
	
	if (command_array[0] == "btn"):
		emit_signal("btn")
	else:
		emit_signal("info",command_array[1], command_array[3], command_array[5])
