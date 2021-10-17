int myColor = color(255);
int c1, c2;
float n, n1;
TextBox usernameBox;
TextBox passwordBox;
TextBox IPBox;
LoginError loginError = new LoginError();

String usernameInput, passwordInput;


void setupLoginScreen() {
  usernameBox = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 450), new PVector(width/1920*400, height / 1080 * 70), false, true);
  passwordBox = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 580), new PVector(width/1920*400, height / 1080 * 70), false, true);
  IPBox = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 1000), new PVector(width/1920*600, height / 1080 * 70), false, true);
  
  textBoxes.add(IPBox);
  textBoxes.add(usernameBox);
  textBoxes.add(passwordBox);
}

void loginScreen() {  

  chatText.visible = false;
  userTB.visible = false;
  emailTB.visible = false;
  password1.visible = false;
  password2.visible = false;
  usernameBox.visible = true;
  passwordBox.visible = true;
  IPBox.visible = true;
  
 // loginError.update();

  for (TextBox t : textBoxes) {
    if (t.visible == false) {
      t.clearText();
    } else {
      t.display();
    }
  }
  textMode(CENTER);
  text("Login", width/2-50, height /4);
  textMode(CORNER);
  text("Username:", width/2 - width/1920*200, height / 1080 * 440);
  text("Password:", width / 2 - width/1920*200, height / 1080 * 570);
  
  hashing(passwordInput);  

  loginError.display();


  But1 = new Button(width/2.13, height/1.5, 100, "Register", color(100, 100, 100));
  if (But1.visible) But1.show();
  But5 = new Button(width/1.74, height/1.5, 100, "Login", color(100, 100, 100));
  if (But5.visible) But5.show();
  But6 = new Button(width/1.25, height/1.05, 100, "Set IP", color(100, 100, 100));
  if (But6.visible) But6.show();
}

class LoginError {

  int errorType = 0;
 /*
  void update() {
   
    if (enter) {
      if (usernameBox.TextLength == 0 && passwordBox.TextLength == 0) {
        errorType = 3;
      } else if (passwordBox.TextLength == 0) {
        errorType = 2;
      } else if (usernameBox.TextLength == 0) {
        errorType = 1;
      } else {
        errorType = 0;
        usernameInput = usernameBox.Text;;
        passwordInput = passwordBox.Text;
        hashing (passwordInput);
        logincheck();
        enter = false;
      }
    }
  }
*/
  void display() {

    textMode(CENTER);
    fill(255, 0, 0);

    switch(errorType) {
    case 0:      
      break;

    case 1:
      text("Error, please type username.", width / 4, height / 3);
      break;

    case 2:
      text("Error, please type password", width / 2, height / 3);
      break;

    case 3:
      text("Error, please type username and password", width / 4, height / 3);
      break;
      
    case 4:
      text("wrong password", width / 4, height / 3);
      break;
    case 5:
      text("wrong username", width / 4, height / 3);
      break;
      
   default:
      errorType = 0;
    }

    textMode(CORNER);
    fill(0, 0, 0);
  }
}
