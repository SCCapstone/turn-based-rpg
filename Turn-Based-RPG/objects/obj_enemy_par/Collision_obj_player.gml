/// @description Insert description here
// You can write your code in this editor
// Left blank to be called when battle system is ready
// Will call the battle system when any of the child enemies collide with the
// player

instance_destroy();
//obj_player._disabled = !obj_player._disabled;
for (var i = 0; i < array_length(global.xp); i++) {
	global.xp[i] = 0;
}
/*for (var i = 0; i < array_length(global.item_gained); i++) {
	global.item_gained[i] = 0;
}*/
global.item_gained = [];
global.gold_gained = 0;






