TextBox userTB, emailTB, password1, password2;
RegisterError registerError = new RegisterError();

void setupRegisterScreen() {

  userTB = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 320), new PVector(width/1920*400, height / 1080 * 70), false, false);
  emailTB = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 450), new PVector(width/1920*400, height / 1080 * 70), false, false);
  password1 = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 580), new PVector(width/1920*400, height / 1080 * 70), false, false);
  password2 = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 710), new PVector(width/1920*400, height / 1080 * 70), false, false);

  textBoxes.add(userTB);
  textBoxes.add(emailTB);
  textBoxes.add(password1);
  textBoxes.add(password2);
}

void registerScreen() {
  
  chatText.visible = false;
  usernameBox.visible = false;
  passwordBox.visible = false;
  userTB.visible = true;
  emailTB.visible = true;
  password1.visible = true;
  password2.visible = true;
  IPBox.visible = false;
  
 // registerError.update();
  
  for (TextBox t : textBoxes){
    if (t.visible == false){
      t.clearText();
    } else {
      t.display();
    }
  }
  
  registerError.display();

  textMode(CENTER);

  textSize(40);
  text("Register", width/2 - width/1920*100, height/5);

  text("Username:", width/2 - width/1920*200, height / 1080 * 300);
  text("Email:", width / 2 - width/1920*200, height / 1080 * 430);
  text("Password:", width / 2 - width/1920*200, height / 1080 * 560);
  text("Confirm Password:", width / 2 - width/1920*200, height / 1080 * 690);

  textMode(CORNER);

  userTB.display();
  emailTB.display();
  password1.display();
  password2.display();
  //println(emailTB.Text);
  textMode(CENTER);
  hashing(password1.Text);
  
      But2 = new Button(width/1.74, height/1.3, 100, "Register", color(100, 100, 100));
      if (But2.visible) But2.show();
      But4 = new Button(width/2.13, height/1.3, 100, "Back", color(100,100,100));
      if (But4.visible) But4.show();
    /*for (TextBox t : textBoxes){
      if (t.visible == true);
      t.display();
    }*/
    
//  }

  //println(textBoxes.size());
}

class RegisterError{
  
  int errorType;
  /*
  void update(){
    
    if (enter){
      if(userTB.TextLength == 0){
        errorType = 1;
      } else if(emailTB.TextLength == 0){
        errorType = 2;
      } else if(password1.TextLength == 0){
        errorType = 3;
      } else if(password2.TextLength == 0){
        errorType = 4;
      }else if(password1.Text != password2.Text){
        errorType = 5;
      } else {
        enter = false;
        gameState = 2;
        errorType = 0;
      }
      
    }
  }
  */
  void display(){
    
    textMode(CENTER);
    fill(255, 0, 0);
    
    switch(errorType){
      
      case 0:
      break;
      
      case 1:
      text("Error, please type username.", width / 4, 9*height / 10);
      break;
      
      case 2:
      text("Error, please type email.", width / 4, 9*height / 10);
      break;
      
      case 3:
      text("Error, please type password.", width / 4, 9*height / 10);
      break;
      
      case 4:
      text("Error, please confirm password.", width / 4, 9*height / 10);
      break;
      
      case 5:
      text("Error, passwords don't match", width / 4, 9*height / 10);
      break;
      
      case 6:
      text("Error, username or email in use", width / 4, 9*height / 10);
      break;    
      default:
      errorType = 0;      
    }
    
    textMode(CORNER);
    fill(0, 0, 0);
  }
  
}
