/// @description Initialize Variables
event_inherited();
randomize(); // move somewhere else eventually
depth = 1;
adjacent_sectors = [self, self, self, self]; // TODO - connect edges on adjacent sectors and through wrap around portals
can_select = false;
image_xscale = 5;
image_yscale = 5;

// Create Spaces
initialize_sector_spaces(self, sector_one());

// Create wall on each edge
/*
with (obj_edge) { 
	var new_wall = instance_create_depth(x, y, 0, obj_stone_wall);
	ds_list_add(occupants, new_wall);
	new_wall.place_on_board = self;
	new_wall.image_angle = new_wall.place_on_board.image_angle;
}

// Delete walls at sector exits
with sector_spaces[2, 0].edges[0] { destroy_all_edge_occupants(self); }
with sector_spaces[4, 2].edges[1] { destroy_all_edge_occupants(self); }
with sector_spaces[2, 4].edges[2] { destroy_all_edge_occupants(self); }
with sector_spaces[0, 2].edges[3] { destroy_all_edge_occupants(self); }
*/