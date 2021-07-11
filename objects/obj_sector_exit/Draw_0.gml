/// @description Draw Sector Exit Arrow
if (exit_direction == 0) { draw_sprite_ext(spr_sector_exit, 0, x, y+8, image_xscale, image_yscale, 0, c_maroon, 0.5); }
if (exit_direction == 1) { draw_sprite_ext(spr_sector_exit, 0, x-8, y, image_xscale, image_yscale, 270, c_maroon, 0.5); }
if (exit_direction == 2) { draw_sprite_ext(spr_sector_exit, 0, x, y-8, image_xscale, image_yscale, 180, c_maroon, 0.5); }
if (exit_direction == 3) { draw_sprite_ext(spr_sector_exit, 0, x+8, y, image_xscale, image_yscale, 90, c_maroon, 0.5); }
event_inherited();