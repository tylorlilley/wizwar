/// @description Remove All Destroyed Tokens
//remove_destroyed_tokens_on_edge(self);


/// @description Color Adjacent Spaces
var colors = [c_red, c_blue, c_green, c_purple];
for (var i = 0; i < 4; i++;) {
	if spaces[i] { spaces[i].highlighted = true; spaces[i].image_blend = colors[i]; }
}