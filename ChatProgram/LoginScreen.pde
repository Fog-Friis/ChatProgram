int myColor = color(255);
int c1, c2;
float n, n1;
TextBox email;
TextBox password;


void setupLoginScreen() {
  email = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 450), new PVector(width/1920*400, height / 1080 * 70), false, true);
  password = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 580), new PVector(width/1920*400, height / 1080 * 70), false, true);

  textBoxes.add(email);
  textBoxes.add(password);
}

void loginScreen() {  

  chatText.visible = false;
  userTB.visible = false;
  emailTB.visible = false;
  password1.visible = false;
  password2.visible = false;
  email.visible = true;
  password.visible = true;
  
  for (TextBox t : textBoxes){
    if(t.visible == false){
      t.clearText();
    } else {
      t.display();
    }
  }
  textMode(CENTER);
  text("Login", width/2, height/2);
  hashing(password.Text);


  But1 = new Button(width/2.13, height/1.5, 100, "Register", color(100, 100, 100));
  if (But1.visible) But1.show();
  But5 = new Button(width/1.74, height/1.5, 100, "Login", color(100, 100, 100));
  if (But5.visible) But5.show();
}
