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
  
  println("benis");
  
  //email.visible = false;
  //password.visible = false;
  email.Text = "";
  email.TextLength = 0;
  password.Text = "";
  password.TextLength = 0;

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
    
    /*for (TextBox t : textBoxes){
      if (t.visible == true);
      t.display();
    }*/
    
//  }

  //println(textBoxes.size());
}
