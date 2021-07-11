/// @description Initialize Variables
event_inherited();
randomize(); // move somewhere else eventually
depth = 1;
adjacent_sectors = [self, self, self, self]; // TODO - connect edges on adjacent sectors and through wrap around portals
can_select = false;
image_xscale = 5;
image_yscale = 5;
