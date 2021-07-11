// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroy_all_edge_occupants(edge) {
	with edge {
		for (var i = 0; i < ds_list_size(occupants); i++;) {
			var occupant = ds_list_find_value(occupants, 0);
			ds_list_delete(occupants, 0);
			with occupant instance_destroy();
		}
	}
}

function create_on_edge(edge, obj_type) {
	with edge {
		var new_obj = instance_create_depth(x, y, 0, obj_type);
		ds_list_add(occupants, new_obj);
		new_obj.place_on_board = self;
		new_obj.image_angle = new_obj.place_on_board.image_angle;
	}
}