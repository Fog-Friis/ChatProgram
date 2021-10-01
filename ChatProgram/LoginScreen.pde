 ControlP5 cp51, cp52, cp53;
 int myColor = color(255);
 int c1,c2;

float n,n1;
 
  void loginScreen() {
    
    textMode(CENTER);
    text("Login", width/2, height/2);
    textMode(CORNER);    
    cp51 = new ControlP5(this);
  cp51.addButton("Login")
  .setValue(0)
  .setPosition(width/1.5,height/1.5)
  .setSize(200,20);
  }
  void setuploginScreen() {
  
  }
  /*
  public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  n = 0;
}*/
  
  public void Login(int theValue) {
    if ((cp51.isMouseOver()== true)) 
    println("a button event from Login: "+theValue);
     gameState += 1;
  }
