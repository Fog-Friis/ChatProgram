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
 
 if (gameState == 0) { //Hvis knappen ikke kan ses eksistere den ikke
  But1.mainMenuB();
  }
  
}
