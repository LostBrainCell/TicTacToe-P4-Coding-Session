// Tic Tac Toe
int[] board = new int[9]; // 0 = empty, 1 = X, 2 = O
int currentPlayer = 1; // 1 = X, 2 = O
int cellSize; // Size of each cell, calculated dynamically
float[] divX = new float[6];
float[] divY = new float[6];
float divWidth;
float divHeight;
//
void setup() {
  // fullScreen(); // Use the full screen
  size(700, 700);
  int appWidth = width; // displayWidth
  int appHeight = height; // displayHeight
  int shorterSide = (appWidth > appHeight) ? appHeight : appWidth;
  cellSize = shorterSide / 3; // Calculate cell size based on screen width

  // Padding for centering
  float widthPadding = (appWidth - shorterSide) / 2;
  float heightPadding = (appHeight - shorterSide) / 2;

  // Initialize divX
  for (int i = 0; i < 4; i++) {
    divX[i] = widthPadding + i * (shorterSide / 3);
  }

  // Initialize divY
  for (int i = 0; i < 4; i++) {
    divY[i] = heightPadding + i * (shorterSide / 3);
  }

  divWidth = divHeight = shorterSide / 3;
}

void draw() {
  background(255); // White background
  stroke(0); // Black lines
  strokeWeight(2);

   // Draw the grid
  for (int i = 1; i < 3; i++) {
    line(divX[i], 0, divX[i], height); // Vertical lines
    line(0, divY[i], width, divY[i]); // Horizontal lines
  }

  // Draw the Xs and Os
  for (int i = 0; i < board.length; i++) {
    int row = i / 3;
    int col = i % 3;
    float x = divX[col] + divWidth / 2; // Center of the cell
    float y = divY[row] + divHeight / 2; // Center of the cell

    if (board[i] == 1) {
      drawX(x, y);
    } else if (board[i] == 2) {
      drawO(x, y);
    }
  }
}
//
void drawX(float x, float y) {
  float offset = cellSize * 0.3;
  line(x - offset, y - offset, x + offset, y + offset);
  line(x + offset, y - offset, x - offset, y + offset);
}
//
void drawO(float x, float y) {
  float radius = cellSize * 0.3;
  ellipse(x, y, radius * 2, radius * 2);
}
//
void mousePressed() {
  // Determine which cell was clicked
  int col = -1;
  int row = -1;

  // Check which column the mouse is in
  for (int i = 0; i < 3; i++) {
    if (mouseX >= divX[i] && mouseX < divX[i + 1]) { // Use < for upper bound
      col = i;
      break;
    }
  }

  // Check which row the mouse is in
  for (int i = 0; i < 3; i++) {
    if (mouseY >= divY[i] && mouseY < divY[i + 1]) { // Use < for upper bound
      row = i;
      break;
    }
  }

  // If a valid cell was clicked
  if (col != -1 && row != -1) {
    int cellIndex = row * 3 + col; // Convert row and column to board index

    // Check if the cell is empty
    if (board[cellIndex] == 0) {
      board[cellIndex] = currentPlayer; // Mark the cell for the current player
      currentPlayer = (currentPlayer == 1) ? 2 : 1; // Switch player
    }
  }
}
