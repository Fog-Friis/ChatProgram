Button But1, But2, But3, But4, But5, But6, But7, But8, But9;
boolean toggleColor;
float sizebutton = 200; 


class Button {
  PVector pos;
  float radius;
  color col;
  String caption;
  boolean visible=true;
  boolean mouseOver=false;

  Button(float x, float y, float r, String txt, color c) {
    pos = new PVector(x, y);
    radius = r;
    caption = txt;
    col = c;
    visible = true;
  }

  void show() {
    rectMode(CORNER);
    fill(col);
    strokeWeight(3);
    float rect1 = pos.x-sizebutton/1.4;
    float rect2 = pos.y-sizebutton/7;
    float rect3 = sizebutton;
    float rect4 = sizebutton/3;
    
    //rect(pos.x-sizebutton/1.4, pos.y-sizebutton/7, sizebutton, sizebutton/3);
    rect(rect1, rect2, rect3, rect4);
    fill(0);
    float fontSize = sizebutton * 0.20;
    textSize(fontSize);
    // float tw = textWidth(caption);
    float tx = pos.x - sizebutton*0.6 ;
    float ty = pos.y + (fontSize / 2);
    text(caption, tx, ty);
  }
 /* void ButtonUpdate() {
    
  }*/
  void mainMenuB() {    

    if  (mouseX>width/1.74-sizebutton/1.4 && mouseX<width/1.74+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.5-sizebutton/7 && mouseY<height/1.5+sizebutton/3-sizebutton/7) 
      {   //Ændre hvad height er divideret for fremtide knapper

      //gameState = 2;
      //enter = true;
      passwordInput = passwordBox.Text;
      hashing (passwordInput);
      logincheck();
      //gameState = 2;

      }
    if  (mouseX>width/2.13-sizebutton/1.4 && mouseX<width/2.13+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.5-sizebutton/7 && mouseY<height/1.5+sizebutton/3-sizebutton/7) 
      {   //Ændre hvad height er divideret for fremtide knapper
      gameState += 1;
     
    }
      }
  
    void chatScreenB() {
      
      if  (mouseX>width/1.05-sizebutton/1.4 && mouseX<width/1.05+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.10-sizebutton/7 && mouseY<height/1.10+sizebutton/3-sizebutton/7) {
        exit();
    }
    
}
  void registerScreenB() {
          if  (mouseX>width/2.13-sizebutton/1.4 && mouseX<width/2.13+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.3-sizebutton/7 && mouseY<height/1.3+sizebutton/3-sizebutton/7) {
      gameState -= 1;
      
      if  (mouseX>width/1.74-sizebutton/1.4 && mouseX<width/1.74+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.3-sizebutton/7 && mouseY<height/1.3+sizebutton/3-sizebutton/7) {
        //upload data to database
       
        gameState += 1;
        
}
}
}
}
