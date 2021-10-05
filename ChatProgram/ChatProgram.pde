GameStateManager gamestateManager;

void setup() {
  gamestateManager = new GameStateManager();
  
  fullScreen();
}
void update() {
  
}

void draw() {
  background(255);
  fill(0,0,0);
  gamestateManager.manage();
}

void mousePressed() {
 switch(gameState) {

    case 0:
  But1.mainMenuB();
  break;
  
  default:
  break;
  }
  
}
