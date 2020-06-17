#extends Button
#
#func find_levels():
#	var levels = []
#	var dir = Directory.new()
#	if dir.open("Levels") == OK:
#		dir.list_dir_begin()
#		var file_name = dir.get_next()
#		while file_name != "":
#			if !dir.current_is_dir():
#				levels.append(file_name)
#			file_name = dir.get_next()
#	return levels;
#
#func _ready():
#	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
#
#func _on_Button_pressed():
#	#get_parent().loadLevelFromLocalhost(2071)
#	#get_parent().loadLevelFromFilesystem("user://lol.cy")
#	#get_parent().get_parent().get_node("LegacyLevel").call("spawnPlayer")
#	$HTTPRequest.request("http://localhost/getMaze.php?maze=120642")
#	set_disabled(true)
#	
#
#func _on_request_completed(result, response_code, headers, body):
#	var response = body.get_string_from_utf8()
#	get_parent().loadLevelFromString(response)
#	get_parent().get_parent().get_node("LegacyLevel").call("spawnPlayer")
#
extends Button

func find_levels():
	var levels = []
	var dir = Directory.new()
	if dir.open("cg") == OK:
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
	
	get_parent().loadLevelFromFilesystem("res://cg/" + level)
	#get_parent().loadLevelFromFilesystem("user://lol.cy")
	get_parent().get_parent().get_node("LegacyLevel").call("spawnPlayer")
	set_disabled(true)
	

