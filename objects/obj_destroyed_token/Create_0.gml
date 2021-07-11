// Inherit the parent event
event_inherited();
max_hp = -1;
hp = -1;

depth -= 1;
image_blend = c_gray;
image_xscale = (irandom(1) == 0) ? 1 : -1;
image_yscale = (irandom(1) == 0) ? 1 : -1;

destroyed_object_type = obj_stone_wall;
