instance_destroy();
for (var i = 0; i < array_length(global.xp); i++) {
	global.xp[i] = 0;
}
for (var i = 0; i < array_length(global.item_gained); i++) {
	global.item_gained[i] = 0;
}
global.gold_gained = 0;