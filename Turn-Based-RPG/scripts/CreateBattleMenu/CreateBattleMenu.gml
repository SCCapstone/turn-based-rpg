// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateBattleMenu(player_party, enemy_party, p_num){
	_menu = instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 0, obj_battle_menu);
	
	_menu._player_party = player_party;
	_menu._enemy_party = enemy_party;
	_menu._p_num = p_num;
}