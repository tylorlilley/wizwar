// Scripts for interacting with edges
function destroy_all_edge_occupants(edge) {
	with edge {
		for (var i = 0; i < ds_list_size(occupants); i++;) {
			var occupant = ds_list_find_value(occupants, 0);
			if (occupant.object_index != obj_destroyed_token) { 
				ds_list_delete(occupants, 0);
				var destroyed_token = instance_create_depth(occupant.x, occupant.y, 0, obj_destroyed_token);
				destroyed_token.image_angle = occupant.image_angle;
				destroyed_token.image_blend = occupant.image_blend;
				destroyed_token.place_on_board = occupant.place_on_board;
				destroyed_token.destroyed_object_type = occupant.object_index;
				ds_list_add(occupants, destroyed_token);
				with occupant instance_destroy();
			}
		}
	}
}

function create_on_edge(edge, obj_type) {
	with edge {
		var new_obj = instance_create_depth(x, y, 0, obj_type);
		ds_list_add(occupants, new_obj);
		new_obj.place_on_board = self;
		new_obj.image_angle = image_angle;
	}
}

function remove_destroyed_tokens_on_edge(edge) {
		with edge {
		for (var i = 0; i < ds_list_size(occupants); i++;) {
			var destroyed_token = ds_list_find_value(occupants, 0);
			if (destroyed_token.object_index == obj_destroyed_token) { 
				ds_list_delete(occupants, 0);
				create_on_edge(self, destroyed_token.destroyed_object_type);
				with destroyed_token { instance_destroy(); }
			}
		}
	}
}

function edge_is_occupied(edge) {
	var occupiers = 0;
	for (var i = 0; i < ds_list_size(edge.occupants); i++;) {
		var occupant = ds_list_find_value(edge.occupants, i);
		if (occupant.object_index != obj_destroyed_token) { occupiers += 1; }
	}
	return (occupiers > 0);
}