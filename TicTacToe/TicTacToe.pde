// Tic Tac Toe
int[] board = new int[9]; // 0 = empty, 1 = X, 2 = O
int currentPlayer = 1; // 1 = X, 2 = O
int cellSize; // Size of each cell, calculated dynamically
float[] divX = new float[6];
float[] divY = new float[6];
float divWidth;
float divHeight;

void setup() {
  // fullScreen(); // Use the full screen
  size(700, 700);
  int appWidth = width; // displayWidth
  int appHeight = height; // displayHeight
  int shorterSide = (appWidth > appHeight) ? appHeight : appWidth;
  cellSize = shorterSide / 3; // Calculate cell size based on screen width

  // Creating the Board
  float widthPadding = (appWidth - shorterSide) / 2;
  divWidth = divHeight = shorterSide / 6;

  // Initialize divX
  for (int i = 0; i < divX.length; i++) {
    divX[i] = widthPadding + i * divWidth;
  }

  // Initialize divY
  for (int i = 0; i < divY.length; i++) {
    divY[i] = i * divHeight;
  }
}

void draw() {
  background(255); // White background
  stroke(0); // Black lines
  strokeWeight(2);

  // Draw the grid
  for (int i = 1; i < 3; i++) {
    // Vertical lines: Extend from the top (y = 0) to the bottom (y = height)
    line(divX[i * 2], 0, divX[i * 2], height);

    // Horizontal lines: Extend from the left (x = 0) to the right (x = width)
    line(0, divY[i * 2], width, divY[i * 2]);
  }


  // Draw the Xs and Os
  for (int i = 0; i < board.length; i++) {
    int row = i / 3;
    int col = i % 3;
    float x = divX[col * 2 + 1];
    float y = divY[row * 2 + 1];

    if (board[i] == 1) {
      drawX(x, y);
    } else if (board[i] == 2) {
      drawO(x, y);
    }
  }
}

void drawX(float x, float y) {
  float offset = cellSize * 0.3;
  line(x - offset, y - offset, x + offset, y + offset);
  line(x + offset, y - offset, x - offset, y + offset);
}

void drawO(float x, float y) {
  float radius = cellSize * 0.3;
  ellipse(x, y, radius * 2, radius * 2);
}
