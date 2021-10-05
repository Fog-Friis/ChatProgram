GameStateManager gamestateManager;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();

void setup() {
  
  setupRegisterScreen();
  gamestateManager = new GameStateManager();

  fullScreen();
}
void update() {
}

void draw() {
  background(255);
  fill(0, 0, 0);
  gamestateManager.manage();

  //for (TextBox t : textBoxes) t.display();
}

void mouseClicked(){
    for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);
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

void keyPressed() {
    
    if (keyCode == 50){two = true;}
    if (keyCode == 18){altgr = true;}
     for (TextBox t : textBoxes) {
      if (t.keyWasTyped(key, (int)keyCode)) {
      }
   }
   
  
}
void keyReleased() {

      if (keyCode == 50){two = false;}
    if (keyCode == 18){altgr = false;}
}
