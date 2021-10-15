GameStateManager gamestateManager;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();

void setup() {
  //Abandon all hope, ye who enter here
  setupRegisterScreen();
  setupLoginScreen();
  setupChat();
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

void mouseClicked(){
    for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);
    
}

void mousePressed() {

  
  
 switch(gameState) {

  case 0:
    But1.mainMenuB();
    break;

  case 1:
  But2.registerScreenB();
    break;
    
   case 2:
   But3.chatScreenB();
     break;

    }
  
  
  }


void keyPressed() {
    //if (key == 'd' || key == 'D') d = true;
    if (keyCode == 50){two = true;} //two keyCode = 2
    if (keyCode == 46){period = true;}
    if (keyCode == 18){altgr = true;}
     for (TextBox t : textBoxes) {
      if (t.keyWasTyped(key, (int)keyCode)) {
      }
   }
   if (key == '.') period = true;
   if (key == ENTER) enter = true;
   
  
}
void keyReleased() {
      if (keyCode == 46){period = false;}
      if (keyCode == 50){two = false;} 
    if (keyCode == 18){altgr = false;}
    if (keyCode == '.') period = false;
    if (key == ENTER) enter = false;
}
