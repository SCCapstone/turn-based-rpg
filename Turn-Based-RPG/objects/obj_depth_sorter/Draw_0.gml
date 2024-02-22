//resizing grid
var _dgrid = ds_depthgrid;
var _inst_num = instance_number(obj_parent_depth);
ds_grid_resize(_dgrid, 2, _inst_num);

//add to grid
var _yy = 0;
with(obj_parent_depth) {
	_dgrid[# 0, _yy] = id;
	_dgrid[# 1, _yy] = y;
	_yy++;
}

//sorting grid
ds_grid_sort(_dgrid, 1, true);

//traverse grid, draw objects
var _inst;
_yy = 0;
repeat(_inst_num) {
	_inst = _dgrid[# 0, _yy];
	with(_inst){
		event_perform(ev_draw,0);
		event_perform(ev_gui,0);
	}
	_yy++;
	
}