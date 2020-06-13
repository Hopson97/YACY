extends Node

func load_level(file):
	get_parent().loadLevelFromFilesystem("Levels/" + file)
	get_parent().get_node("LegacyLevel").call("spawnPlayer")


func _ready():
	var dir = Directory.new()
	if dir.open("Levels") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var x = 0
		var y = 0
		var w = 100
		var h = 50
		while file_name != "":
			if !dir.current_is_dir():
				print("Found file: " + file_name)
				var button = Button.new()
				button.set_size(Vector2(w, h))
				button.set_position(Vector2(x, y));
				y += h + 10;
				button.connect("button_down", self, "load_level", [file_name])
				add_child(button)
			file_name = dir.get_next()

