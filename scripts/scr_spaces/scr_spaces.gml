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
		var warp_edge = false;
		
		// Set adjacent space to that of a different sector if needed
		if (!instance_place(adj_space_x, adj_space_y, obj_sector)) {
			warp_edge = true;
			switch (dir)
			{
				case (directions.UP): {
					adj_space_y += sector.sprite_height;
					adj_space_y += sector.adjacent_sectors[dir].y;
					adj_space_y -= sector.y;
					break;
				}
				case (directions.RIGHT): {
					adj_space_x -= sector.sprite_width;
					adj_space_x += sector.adjacent_sectors[dir].x;
					adj_space_x -= sector.x;
					break;
				}
				case (directions.DOWN): {
					adj_space_y -= sector.sprite_height;
					adj_space_y += sector.adjacent_sectors[dir].y;
					adj_space_y -= sector.y;
					break;
				}
				case (directions.LEFT): {
					adj_space_x += sector.sprite_width;
					adj_space_x += sector.adjacent_sectors[dir].x;
					adj_space_x -= sector.x;
					break;
				}
			}
			x2 = adj_space_x;
			y2 = adj_space_y;
		}
		
		// Connect space to neighboring space in this direction if it already exists
		if (instance_place(adj_space_x, adj_space_y, obj_space)) { 
			connect_spaces(self, instance_place(adj_space_x, adj_space_y, obj_space), dir);
		}
		// Create new edges around this space since no space exists where one will yet
		else { 
			adjacent_spaces[dir] = noone;
			edges[dir] = instance_create_depth(adj_edge_x, adj_edge_y, depth-1, edge_type);
			edges[dir].image_angle = 90 * dir;
			edges[dir].spaces[opposite_dir(dir)] = self;
		}
		edges[dir].warp_edge = warp_edge;
	}
}

function connect_spaces(space1, space2, dir) {
	with space1 {
		adjacent_spaces[dir] = space2;
		space2.adjacent_spaces[opposite_dir(dir)] = space1;
		edges[dir] = space2.edges[opposite_dir(dir)];
		edges[dir].spaces[opposite_dir(dir)] = self;
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