extends Button

func find_levels():
	var levels = []
	var dir = Directory.new()
	if dir.open("Levels") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				levels.append(file_name)
			file_name = dir.get_next()
	return levels;

func _ready():
	print("GDNS Test")
	##get_parent().get_parent().get_node("LegacyLevel/ObjectLoader").create_wall(Vector2(-30,-30), Vector2(100,100), 1, 1, 1)

func _on_Button_pressed():
	#get_parent().loadLevelFromLocalhost(2071)
	var levels = find_levels()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var level = levels[rng.randi_range(0, levels.size() - 1)]
	print(level)
	
	get_parent().loadLevelFromFilesystem("res://Levels/" + level)
	get_parent().get_parent().get_node("LegacyLevel").call("spawnPlayer")
	#get_parent().loadLevelFromFilesystem("user://lol.cy")
	#get_parent().get_parent().get_node("LegacyLevel").call("spawnPlayer")
	set_disabled(true)
	

