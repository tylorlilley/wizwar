/// @description Draw Sector Exit Arrow
var offset = 8;
for (var i = 0; i < 4; i++;) {
	var pos = pos_in_dir(i, offset);
	if (spaces[i] != noone) { 
		draw_sprite_ext(spr_sector_exit, 0, pos[0], pos[1], 1, 1, -90*opposite_dir(i), exit_color, 0.5); 
	}
}
event_inherited();