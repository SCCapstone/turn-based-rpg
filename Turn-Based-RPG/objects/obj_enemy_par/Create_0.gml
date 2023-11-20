/// Enemy basics

// Variables

state = ENEMY_STATE.IDLE; // default of all enemies
x_spd = 0;
y_spd = 0;
x_to = xstart;
y_to = ystart;
dir = 0;
time_passed = 0;
wait_duration = 60; // time between movements for the wander script
wait = 0;
aggro = 0;
aggro_duration = 5;
// enemy_wander_distance = 32;
// enemy_speed = 0.75;

// script
enemy_script[ENEMY_STATE.IDLE] = -1;
enemy_script[ENEMY_STATE.ROAM] = -1;
enemy_script[ENEMY_STATE.CHASE] = -1;

