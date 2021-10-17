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

    case 100:
      menuScreen();
      break;

    case 2:
      chatScreen();
      break;

    default:
      gameState = 0;
      break;
    }
  }
}
