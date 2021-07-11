/// @description Initialize Variables
event_inherited();
depth -= 2;
occupants = ds_list_create();
inside_space = noone; // always the space above or to the left of this edge
outside_space = noone; // always the space below or to the right of this edge
