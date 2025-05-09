//Variables
/*
int[] board = new int[9]; // 0 = empty, 1 = X, 2 = O
int currentPlayer = 1; // 1 = X, 2 = O
int cellSize; // Size of each cell, calculated dynamically

void setup() {
  //fullScreen(); // Use the full screen
  size(700, 500);
  int appWidth = width; //displayWidth
  int appHeight = height; //displayHeight
  int shorterSide = ( appWidth > appHeight ) ? appHeight : appWidth ;
  cellSize = shorterSide / 3; // Calculate cell size based on screen width
  //Creating the Board, with Scoreboard
  int padding;
  if ( appWidth > appHeight ) {
    padding = ( appWidth*1/2 - cellSize*3) / 2 ;
    
  } else {
  }
  noLoop();
}

void draw() {
  background(255);
  drawGrid();
  drawMarks();
}

void drawGrid() {
  stroke(0);
  for (int i = 1; i < 3; i++) {
    line(i * cellSize, 0, i * cellSize, height); // Vertical lines
    line(0, i * cellSize, width, i * cellSize); // Horizontal lines
  }
}

void drawMarks() {
  textAlign(CENTER, CENTER);
  textSize(cellSize / 2); // Adjust text size dynamically
  for (int i = 0; i < 9; i++) {
    int row = i / 3;
    int col = i % 3;
    if (board[i] == 1) {
      text("X", col * cellSize + cellSize / 2, row * cellSize + cellSize / 2);
    } else if (board[i] == 2) {
      text("O", col * cellSize + cellSize / 2, row * cellSize + cellSize / 2);
    }
  }
}

void mousePressed() {
  int col = mouseX / cellSize;
  int row = mouseY / cellSize;
  int index = row * 3 + col;

  if (col < 3 && row < 3 && board[index] == 0) {
    board[index] = currentPlayer;
    currentPlayer = 3 - currentPlayer; // Switch player
    redraw();
  }
}
*/
