randomize(); // Reseed random variable
global.width = 350;
global.height = 60;
global.ui_x_buffer = 3;
global.ui_y_buffer = 137;
global.text_x_buffer = 6;
global.text_y_buffer = 4;
global.text_max_width = global.width - (2 * (global.ui_x_buffer));

// creates the character array
#region Player
globalvar character;
character = array_create(1);

// Player name placeholder
// in order its name, level, experience points, starting stats, and max stats
character[0] = new Player("Player", 1, 0, [60, 20, 10, 10, 10, 10, 8], 
             [999, 999, 999, 999, 999, 999, 999]);
// character[0].stats = new Stats(60, 20, 10, 10, 10, 10, 8);
#endregion