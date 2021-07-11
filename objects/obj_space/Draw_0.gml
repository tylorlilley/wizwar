/// @description Draw Columns at Wall Corners
event_inherited();
var x_offset = sprite_width/2, y_offset = sprite_height/2, scale = 0.375;
if (ds_list_size(edges[3].occupants) > 0 || ds_list_size(edges[0].occupants) > 0) { draw_sprite_ext(spr_space, 0, x-x_offset, y-y_offset, scale, scale, 0, c_gray, 1); }
if (ds_list_size(edges[0].occupants) > 0 || ds_list_size(edges[1].occupants) > 0) { draw_sprite_ext(spr_space, 0, x+x_offset, y-y_offset, scale, scale, 0, c_gray, 1); }
if (ds_list_size(edges[1].occupants) > 0 || ds_list_size(edges[2].occupants) > 0) { draw_sprite_ext(spr_space, 0, x+x_offset, y+y_offset, scale, scale, 0, c_gray, 1); }
if (ds_list_size(edges[2].occupants) > 0 || ds_list_size(edges[3].occupants) > 0) { draw_sprite_ext(spr_space, 0, x-x_offset, y+y_offset, scale, scale, 0, c_gray, 1); }