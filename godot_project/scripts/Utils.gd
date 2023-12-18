extends Node

func find_node_of_type(find_type, start_node = null):
	if start_node == null:
		start_node = get_tree().get_root()
	
	return find_node_of_type_recursive(start_node, find_type)

func find_node_of_type_recursive(current_node, find_type):
	var _objName = current_node.name
	var objClass = current_node.get_class()
	if objClass == find_type:
		return current_node

	for child in current_node.get_children():
		var tmp = find_node_of_type_recursive(child, find_type)
		if tmp != null:
			return tmp
			
	return null
			

func find_player():
	var player = find_node_of_type("Camera3D")
	if player == null:
		print("Camera not found, can't find player!")
	else:
		player = player.get_node("../")
		return player
		
