// Scripts for interacting with spaces
function initialize_space_edges(space, edge_information) {
	for (var i = 0; i < 4; i++;) { initialize_space_edge(space, i, edge_information[i]) }
}

function initialize_space_edge(space, dir, edge_type) {
	with space {
		var y_offset = sprite_height/2, x_offset= sprite_width/2;
		var adj_space_x = pos_in_dir(dir, sprite_width)[0], 
		var adj_space_y = pos_in_dir(dir, sprite_height)[1],
		var adj_edge_x = pos_in_dir(dir, x_offset)[0]; 
		var adj_edge_y = pos_in_dir(dir, y_offset)[1];
		
		// Share edges with neighbor if edge already exists, if not, create an edge of the given edge type
		if (instance_place(adj_space_x, adj_space_y, obj_space)) { 
			adjacent_spaces[dir] = instance_place(adj_space_x, adj_space_y, obj_space);
			edges[dir] = adjacent_spaces[dir].edges[opposite_dir(dir)];
			edges[dir].outside_space = self;
			edges[dir].outside_dir = opposite_dir(dir);
		}
		else { 
			adjacent_spaces[dir] = noone;
			edges[dir] = instance_create_depth(adj_edge_x, adj_edge_y, depth-1, edge_type);
			edges[dir].image_angle = 90 * dir;
			edges[dir].inside_space = self;
			edges[dir].inside_dir = opposite_dir(dir);
		}
	}
}

function create_objects_around_space(space, objects_to_create) {
	with space {
		for (var i = 0; i < 4; i++;) {
			if (objects_to_create[i] && !edge_is_occupied(edges[i])) { 
				create_on_edge(edges[i], objects_to_create[i]); 
			}
		}
	}
}