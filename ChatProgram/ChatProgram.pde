GameStateManager gamestateManager;

void setup() {
  gamestateManager = new GameStateManager();
  
  fullScreen();
  
}

void draw() {
  background(255);
  fill(0,0,0);
  gamestateManager.manage();
}

void keyPressed(){
  gameState += 1;
}
