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
			
func find_node_by_name(find_name, start_node = null):
	if start_node == null:
		start_node = get_tree().get_root()
	
	return find_node_by_name_recursive(start_node, find_name)

func find_node_by_name_recursive(current_node, find_name):
	var objName = current_node.name
	if objName == find_name:
		return current_node

	for child in current_node.get_children():
		var tmp = find_node_by_name_recursive(child, find_name)
		if tmp != null:
			return tmp
			
	return null
			

func find_player():
	return find_node_by_name("Player", null)
		
func find_game_text():
	return find_node_by_name("GameText", null)
