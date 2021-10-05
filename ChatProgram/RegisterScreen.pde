

void setupRegisterScreen() {
  
  TextBox userTB = new TextBox(new PVector(width/2, height/4), new PVector(35,200));
  TextBox emailTB = new TextBox(new PVector(width/2, height/2), new PVector(35,200));
  
  textBoxes.add(userTB);
  textBoxes.add(emailTB);
}

void registerScreen() {

  textMode(CENTER);
  text("Register", width/2, height/2);
  textMode(CORNER);
  
  for (TextBox t : textBoxes){
    t.display();
  }


}
