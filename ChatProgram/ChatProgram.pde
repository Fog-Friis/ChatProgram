GameStateManager gamestateManager;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();

void setup() {
  gamestateManager = new GameStateManager();

  fullScreen();
}
void update() {
}

void draw() {
  background(255);
  fill(0, 0, 0);
  gamestateManager.manage();
}
void mousePressed() {

  for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);

  switch(gameState) {

  case 0:
    But1.mainMenuB();
    break;

  default:
    break;
  }
}

void keyPressed() {
  //gameState += 1;
}
