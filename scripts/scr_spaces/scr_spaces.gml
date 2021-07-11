// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initialize_space_edges(space, edge_information) {
	with space {
		var y_offset = sprite_height/2, x_offset= sprite_width/2;
		// Share edges with neighbor if wall exists, if not, create a wall if one should exist based on the given wall information
		if (instance_place(x, y-sprite_height, obj_space)) { 
			adjacent_spaces[0] = instance_place(x, y-sprite_height, obj_space);
			edges[0] = adjacent_spaces[0].edges[2];
			edges[0].outside_space = self;
		}
		else { 
			adjacent_spaces[0] = noone;
			edges[0] = instance_create_depth(x, y-y_offset, -1, edge_information[0]);
			edges[0].inside_space = self;
			if (edge_information[0] == obj_sector_exit) { edges[0].exit_direction = 0; }
		}
		if (instance_place(x+sprite_width, y, obj_space)) { 
			adjacent_spaces[1] = instance_place(x+sprite_width, y, obj_space);
			edges[1] = adjacent_spaces[1].edges[3];
			edges[1].outside_space = self;
		}
		else {
			adjacent_spaces[1] = noone;
			edges[1] = instance_create_depth(x+x_offset, y, -1, edge_information[1]);
			edges[1].image_angle = 90;
			edges[1].inside_space = self;
			if (edge_information[1] == obj_sector_exit) { edges[1].exit_direction = 1; }
		}
		if (instance_place(x, y+sprite_height, obj_space)) { 
			adjacent_spaces[2] = instance_place(x, y+sprite_height, obj_space);
			edges[2] = adjacent_spaces[2].edges[0];
			edges[2].outside_space = self;
		}
		else {
			adjacent_spaces[2] = noone;
			edges[2] = instance_create_depth(x, y+y_offset, -1, edge_information[2]);
			edges[2].inside_space = self;
			if (edge_information[2] == obj_sector_exit) { edges[2].exit_direction = 2; }
		}
		if (instance_place(x-sprite_width, y, obj_space)) { 
			adjacent_spaces[3] = instance_place(x-sprite_width, y, obj_space);
			edges[3] = adjacent_spaces[3].edges[1];
			edges[3].outside_space = self;
		}
		else {
			adjacent_spaces[3] = noone;
			edges[3] = instance_create_depth(x-x_offset, y, -1, edge_information[3]); 
			edges[3].image_angle = 90;
			edges[3].inside_space = self;
			if (edge_information[3] == obj_sector_exit) { edges[3].exit_direction = 3; }
		}
	}
}

function create_objects_around_space(space, edge_information) {
	with space {
		for (var i = 0; i < 4; i++;) {
			if (edge_information[i] && ds_list_size(edges[i].occupants) == 0) { 
				create_on_edge(edges[i], edge_information[i]); 
			}
		}
	}
}