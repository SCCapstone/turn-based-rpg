// Draw Health Bar
var barWidth = 100; 
var barHeight = 10; 
draw_rectangle(x - barWidth / 2, y - 30, x + (health / 100) * barWidth - barWidth / 2, y - 20, false);

// Draw event in the UI
draw_text(10, 10, "Health: " + string(health));