// Direction Based Scripts
enum directions {
	UP,
	RIGHT,
	DOWN,
	LEFT
}

function opposite_dir(dir){
	return (dir + 2) mod 4;
}

function clockwise_dir(dir){
	return (dir + 1) mod 4;
}

function pos_in_dir(dir, dist) {
	var pos;
	pos[0] = x;
	pos[1] = y;
	
	switch (dir)
	{
		case directions.UP: { pos[1] -= dist; break; }
		case directions.RIGHT: { pos[0] += dist; break; }
		case directions.DOWN: { pos[1] += dist; break; }
		case directions.LEFT: { pos[0] -= dist; break; }
	}
	return pos;
}