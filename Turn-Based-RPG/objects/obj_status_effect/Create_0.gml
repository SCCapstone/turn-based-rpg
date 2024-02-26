// Use this code to call any object that will flash
// on the screen during battle, such as weapons, spells,
// status effects, etc.

sprite_index = _sprite;
image_xscale = _xscale;
image_yscale = _yscale;

_find = function(_element, _index)
{
	return (_element == _effect);
}

_effect_index = array_find_index(_caller._effects, _find);