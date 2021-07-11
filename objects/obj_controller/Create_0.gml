var sector_size = 16*5;

var sector1 = instance_create_depth(sector_size/2, sector_size/2, 0, obj_sector);
initialize_sector_spaces(sector1, sector_one());

var sector2 = instance_create_depth(sector_size/2+sector_size, sector_size/2, 0, obj_sector);
initialize_sector_spaces(sector2, sector_one());

var sector3 = instance_create_depth(sector_size/2, sector_size/2+sector_size, 0, obj_sector);
initialize_sector_spaces(sector3, sector_one());

var sector4 = instance_create_depth(sector_size/2+sector_size, sector_size/2+sector_size, 0, obj_sector);
initialize_sector_spaces(sector4, sector_one());