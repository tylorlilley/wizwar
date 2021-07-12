// Script for interacting with sectors
function initialize_sector_spaces(sector, sector_information) {
	with sector {
		var x_offset = 16, y_offset = 16;
		var left_x = x-sprite_width/2+x_offset/2, top_y = y-sprite_height/2+y_offset/2;

		for (var i = 0; i < 5; i++;) {
			for (var j = 0; j < 5; j++;) {
				var space_type = obj_space;
				if ((i == 1 && j == 1) || (i == 3 && j == 3)) { space_type = obj_treasure_spot; }
				if (i == 2 && j == 2) { space_type = obj_home_base_spot; }
				
				var edge_information = [obj_edge, obj_edge, obj_edge, obj_edge];
				if (i == 2 && j == 0) { edge_information[0] = obj_sector_exit; }
				if (i == 4 && j == 2) { edge_information[1] = obj_sector_exit; }
				if (i == 2 && j == 4) { edge_information[2] = obj_sector_exit; }
				if (i == 0 && j == 2) { edge_information[3] = obj_sector_exit; }
				
				spaces[i, j] = instance_create_depth(left_x+((i)*x_offset), top_y+((j)*y_offset), 0, space_type);
				spaces[i, j].sector = self;
				initialize_space_edges(spaces[i, j], edge_information);
				create_objects_around_space(spaces[i, j], sector_information[i, j]);
			}
		}
		
		with spaces[2, 0].edges[0] { instance_change(obj_sector_exit, true); }
		with spaces[4, 2].edges[1] { instance_change(obj_sector_exit, true); image_angle = 90; }
		with spaces[2, 4].edges[2] { instance_change(obj_sector_exit, true); }
		with spaces[0, 2].edges[3] { instance_change(obj_sector_exit, true); image_angle = 90; }
	}
}

function initialize_sector_edges(sector) {
	for (var i = 0; i < 4; i++;) { 
		initialize_sector_edge(sector, i);
	}
}

function initialize_sector_edge(sector, dir) {
	with sector {
		var sector_size = 80;
		var pos = pos_in_dir(dir, sector_size)
		if instance_place(pos[0], pos[1], obj_sector) { 
			adjacent_sectors[dir] = instance_place(pos[0], pos[1], obj_sector);
			connected_by_warp[dir] = false;
		}
	}
}

function blank_sector() {
	var sector_information;
	
	sector_information[0, 0] = [false, false, false, false];
	sector_information[0, 1] = [false, false, false, false];
	sector_information[0, 2] = [false, false, false, false];
	sector_information[0, 3] = [false, false, false, false];
	sector_information[0, 4] = [false, false, false, false];
	
	sector_information[1, 0] = [false, false, false, false];
	sector_information[1, 1] = [false, false, false, false];
	sector_information[1, 2] = [false, false, false, false];
	sector_information[1, 3] = [false, false, false, false];
	sector_information[1, 4] = [false, false, false, false];
	
	sector_information[2, 0] = [false, false, false, false];
	sector_information[2, 1] = [false, false, false, false];
	sector_information[2, 2] = [false, false, false, false];
	sector_information[2, 3] = [false, false, false, false];
	sector_information[2, 4] = [false, false, false, false];
	
	sector_information[3, 0] = [false, false, false, false];
	sector_information[3, 1] = [false, false, false, false];
	sector_information[3, 2] = [false, false, false, false];
	sector_information[3, 3] = [false, false, false, false];
	sector_information[3, 4] = [false, false, false, false];
	
	sector_information[4, 0] = [false, false, false, false];
	sector_information[4, 1] = [false, false, false, false];
	sector_information[4, 2] = [false, false, false, false];
	sector_information[4, 3] = [false, false, false, false];
	sector_information[4, 4] = [false, false, false, false];
	
	return sector_information;
}

function sector_with_outer_walls() {
	var sector_information = blank_sector();
	
	for (var i = 0; i < 5; i++;) {
		if (i != 2) {
			sector_information[i, 0][0] = obj_stone_wall;
			sector_information[4, i][1] = obj_stone_wall;
			sector_information[i, 4][2] = obj_stone_wall;
			sector_information[0, i][3] = obj_stone_wall;
		}
	}
	
	return sector_information;
}

function sector_one() {
	var sector_information = sector_with_outer_walls();
	
	sector_information[0, 1][1] = obj_stone_wall;
	sector_information[0, 2][2] = obj_stone_wall;
	
	sector_information[1, 0][2] = obj_stone_wall;
	sector_information[1, 1][1] = obj_stone_wall;
	sector_information[1, 2][1] = obj_stone_wall;
	sector_information[1, 2][2] = obj_door;
	sector_information[1, 3][2] = obj_stone_wall;
	
	sector_information[2, 0][2] = obj_stone_wall;
	sector_information[2, 2][1] = obj_stone_wall;
	sector_information[2, 3][2] = obj_stone_wall;
	
	sector_information[3, 0][2] = obj_stone_wall;
	sector_information[3, 1][2] = obj_stone_wall;
	sector_information[3, 3][1] = obj_stone_wall;
	sector_information[3, 3][2] = obj_stone_wall;
	
	sector_information[4, 1][2] = obj_stone_wall;
	sector_information[4, 2][2] = obj_door;
	
	return sector_information;
}

function sector_two() {
	var sector_information = sector_with_outer_walls();
	
	sector_information[0, 1][1] = obj_stone_wall;
	sector_information[0, 2][2] = obj_stone_wall;
	
	sector_information[1, 0][2] = obj_stone_wall;
	sector_information[1, 1][1] = obj_stone_wall;
	sector_information[1, 2][1] = obj_stone_wall;
	sector_information[1, 2][2] = obj_door;
	sector_information[1, 3][2] = obj_stone_wall;
	
	sector_information[2, 0][2] = obj_stone_wall;
	sector_information[2, 2][1] = obj_stone_wall;
	sector_information[2, 3][2] = obj_stone_wall;
	
	sector_information[3, 0][2] = obj_stone_wall;
	sector_information[3, 1][2] = obj_stone_wall;
	sector_information[3, 3][1] = obj_stone_wall;
	sector_information[3, 3][2] = obj_stone_wall;
	
	sector_information[4, 1][2] = obj_stone_wall;
	sector_information[4, 2][2] = obj_door;
	
	return sector_information;
}