width = 0;
height = 0;

// The text that is displayed. Note: Text wrap is not a thing.
// Each line of text must be defined separately and each object must be resized manually
option[0] = "Map menu";
option[1] = "Battle";
option[2] = "Quit game";

// The length of the array, stored for ease of access
op_length = array_length(option);

pos = 0;

op_border = global.op_border
op_space = global.op_space
op_margin = global.op_margin