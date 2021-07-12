/// @description Perform Game Setup
randomize();

var sector_size = 16*5;

// Create sectors
var sector1 = instance_create_depth(sector_size/2, sector_size/2, 0, obj_sector);
var sector2 = instance_create_depth(sector_size/2+sector_size, sector_size/2, 0, obj_sector);
var sector3 = instance_create_depth(sector_size/2, sector_size/2+sector_size, 0, obj_sector);
var sector4 = instance_create_depth(sector_size/2+sector_size, sector_size/2+sector_size, 0, obj_sector);

// Connect sectors by warp
sector1.adjacent_sectors[0] = sector4;
sector1.adjacent_sectors[3] = sector4;
sector2.adjacent_sectors[0] = sector3;
sector2.adjacent_sectors[1] = sector3;
sector3.adjacent_sectors[2] = sector2;
sector3.adjacent_sectors[3] = sector2;
sector4.adjacent_sectors[1] = sector1;
sector4.adjacent_sectors[2] = sector1;

// Have sectors detect their neighbors
with obj_sector { initialize_sector_edges(self); }

// Initialize the spaces (and edges) within a sector
initialize_sector_spaces(sector1, sector_one());
initialize_sector_spaces(sector2, sector_one());
initialize_sector_spaces(sector3, sector_one());
initialize_sector_spaces(sector4, sector_one());

//Real Board Labels: 2, 4, 3, 1, E2, E1, K2, K1