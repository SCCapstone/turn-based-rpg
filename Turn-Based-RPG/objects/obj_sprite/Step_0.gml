// Delay draw event until sprite and scale are set

if (_sprite != noone && _scale != 0) {
	sprite_index = _sprite;
	image_xscale = _scale;
	_draw = true;
}