TextBox userTB, emailTB, password1, password2;

void setupRegisterScreen() {

  userTB = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 320), new PVector(width/1920*400, height / 1080 * 70), false, false);
  emailTB = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 450), new PVector(width/1920*400, height / 1080 * 70), false, false);
  password1 = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 580), new PVector(width/1920*400, height / 1080 * 70), false, false);
  password2 = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 710), new PVector(width/1920*400, height / 1080 * 70), true, false);

  textBoxes.add(userTB);
  textBoxes.add(emailTB);
  textBoxes.add(password1);
  textBoxes.add(password2);
}

void registerScreen() {
  
  email.visible = false;
  password.visible = false;
  userTB.visible = true;
  emailTB.visible = true;
  password1.visible = true;
  password2.visible = true;
  
  for (TextBox t : textBoxes){
    if (t.visible == false){
      t.clearText();
    } else {
      t.display();
    }
  }

  textMode(CENTER);

  textSize(40);
  text("Register", width/2 - width/1920*100, height/5);

  text("Username:", width/2 - width/1920*200, height / 1080 * 300);
  text("Email:", width / 2 - width/1920*200, height / 1080 * 430);
  text("Password:", width / 2 - width/1920*200, height / 1080 * 560);
  text("Confirm Password:", width / 2 - width/1920*200, height / 1080 * 690);

  textMode(CORNER);
<<<<<<< Updated upstream
=======

  userTB.display();
  emailTB.display();
  password1.display();
  password2.display();
  println(emailTB.Text);
    
      But2 = new Button(width/1.3, height/1.3, 100, "Login", color(100, 100, 100));
      if (But2.visible) But2.show();
    /*for (TextBox t : textBoxes){
      if (t.visible == true);
      t.display();
    }*/
    
//  }

  //println(textBoxes.size());
>>>>>>> Stashed changes
}
