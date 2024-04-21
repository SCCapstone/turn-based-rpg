// For unit testing milestone pt. 2

init()

state = turn.player

p = [global.party[|0], global.party[|1]]
e = [global.enemies.mercenary, global.enemies.dark_wizard]

for (var i = 0; i < array_length(p); i++) {
	party[i] = instance_create_depth(x, y, 1000, obj_party_unit, ds_list_find_value(global.party, i));
	party[i].visible = false;
	party[i]._effects = ds_list_create();
	party[i]._is_dead = false;
}

for (var i = 0; i < array_length(e); i++) {
	enemies[i] = instance_create_depth(x, y, 1000, obj_enemy_unit, e[i]);
	enemies[i].visible = false;
	enemies[i]._effects = ds_list_create();
	enemies[i]._is_dead = false;
}

pages = 3;
pos = 0;

xp_gained = [];