  int gameState = 0;

class GameStateManager {

  void setManagerUp() {
  }

  void manage() {


    switch(gameState) {

    case 0:
      loginScreen();
      break;

    case 1:
      registerScreen();
      break;

      case 2:
      menuScreen();
      break;

    case 3:
      chatScreen();
      break;

    default:
      gameState = 0;
      break;
    }
  }

  void loginScreen() {
    textMode(CENTER);
    text("Login", width/2, height/2);
    textMode(CORNER);    
  }

  void registerScreen() {
    textMode(CENTER);
    text("Register", width/2, height/2);
    textMode(CORNER);
  }

  void menuScreen() {
    textMode(CENTER);
    text("Menu", width/2, height/2);
    textMode(CORNER);
  }

  void chatScreen() {
    textMode(CENTER);
    text("chat", width/2, height/2);
    textMode(CORNER);
  }
}
