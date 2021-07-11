/// @description Draw Columns at Wall Corners
event_inherited();
var x_offset = sprite_width/2, y_offset = sprite_height/2, scale = 0.375;

for (var i = 0; i < 4; i++) {
	if (edge_is_occupied(edges[i]) || edge_is_occupied(edges[clockwise_dir(i)])) {
		var x_pos = pos_in_dir(i, x_offset)[0] == x ? pos_in_dir(clockwise_dir(i), x_offset)[0] : pos_in_dir(i, x_offset)[0];
		var y_pos = pos_in_dir(i, y_offset)[1] == y ? pos_in_dir(clockwise_dir(i), y_offset)[1] : pos_in_dir(i, y_offset)[1];
		draw_sprite_ext(spr_space, 0, x_pos, y_pos, scale, scale, 0, c_gray, 1);
	}
}
