import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.sql.*; 
import java.security.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ChatProgram extends PApplet {

 GameStateManager gamestateManager;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();

public void setup() {
  //Abandon all hope, ye who enter here
  setupRegisterScreen();
  setupLoginScreen();
  setupChat();
  gamestateManager = new GameStateManager();

  
}
public void update() {
}

public void draw() {
  background(255);
  fill(0, 0, 0);
  gamestateManager.manage();
}

public void mouseClicked() {
  for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);
}

public void mousePressed() {



  switch(gameState) {

  case 0:
    
    But1.mainMenuB();
    break;

  case 1:
    But2.registerScreenB();
    break;

  case 2:
    But3.chatScreenB();
    break;
  }
}


public void keyPressed() {
  //if (key == 'd' || key == 'D') d = true;
  if (keyCode == 50) {
    two = true;
  } //two keyCode = 2
  if (keyCode == 46) {
    period = true;
  }
  if (keyCode == 18) {
    altgr = true;
  }
  for (TextBox t : textBoxes) {
    if (t.keyWasTyped(key, (int)keyCode)) {
    }
  }
  //if (keyCode == 59) AE = true;
  //if (keyCode == 222) OE = true;
  //if (keyCode == 93) AA = true;
  if (key == SHIFT) shift = true;
  if (key == ENTER) enter = true;
}
public void keyReleased() {
  if (keyCode == 46) {
    period = false;
  }
  if (keyCode == 50) {
    two = false;
  } 
  if (keyCode == 18) {
    altgr = false;
  }

  
  //if (keyCode == 59) AE = false;
  //if (keyCode == 222) OE = false;
  //if (keyCode == 93) AA = false;
  if (key == SHIFT) shift = true;
  if (key == ENTER) enter = false;
}
Button But1, But2, But3, But4, But5, But6;
boolean toggleColor;
float sizebutton = 200; 


class Button {
  PVector pos;
  float radius;
  int col;
  String caption;
  boolean visible=true;
  boolean mouseOver=false;

  Button(float x, float y, float r, String txt, int c) {
    pos = new PVector(x, y);
    radius = r;
    caption = txt;
    col = c;
    visible = true;
  }

  public void show() {
    rectMode(CORNER);
    fill(col);
    strokeWeight(3);
    float rect1 = pos.x-sizebutton/1.4f;
    float rect2 = pos.y-sizebutton/7;
    float rect3 = sizebutton;
    float rect4 = sizebutton/3;
    
    //rect(pos.x-sizebutton/1.4, pos.y-sizebutton/7, sizebutton, sizebutton/3);
    rect(rect1, rect2, rect3, rect4);
    fill(0);
    float fontSize = sizebutton * 0.20f;
    textSize(fontSize);
    // float tw = textWidth(caption);
    float tx = pos.x - sizebutton*0.6f ;
    float ty = pos.y + (fontSize / 2);
    text(caption, tx, ty);
  }

  public void mainMenuB() {    

    if  (mouseX>width/1.74f-sizebutton/1.4f && mouseX<width/1.74f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.5f-sizebutton/7 && mouseY<height/1.5f+sizebutton/3-sizebutton/7) 
      {   //Ændre hvad height er divideret for fremtide knapper

          passwordInput = passwordBox.Text;
          hashing (passwordInput);
          logincheck();     
      }
      else 
  /*    
    if  (mouseX>width/1.25-sizebutton/1.4 && mouseX<width/1.25+sizebutton-sizebutton/1.4 &&    
      mouseY>height/1.05-sizebutton/7 && mouseY<height/1.05+sizebutton/3-sizebutton/7) 
      {   //Ændre hvad height er divideret for fremtide knapper
     // IP = IPBox.Text;
     
    }
    else
    */
    {
    if  (mouseX>width/2.13f-sizebutton/1.4f && mouseX<width/2.13f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.5f-sizebutton/7 && mouseY<height/1.5f+sizebutton/3-sizebutton/7) 
      {   //Ændre hvad height er divideret for fremtide knapper
      gameState += 1;
     
    }
    }
      }
  
    public void chatScreenB() {
      
      if  (mouseX>width/1.04f-sizebutton/1.4f && mouseX<width/1.04f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/25-sizebutton/7 && mouseY<height/25+sizebutton/3-sizebutton/7) {
        exit();
    }
    
}
  public void registerScreenB() {
          if  (mouseX>width/2.13f-sizebutton/1.4f && mouseX<width/2.13f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.3f-sizebutton/7 && mouseY<height/1.3f+sizebutton/3-sizebutton/7) {
      gameState -= 1;
      }
      else
      
      if  (mouseX>width/1.74f-sizebutton/1.4f && mouseX<width/1.74f+sizebutton-sizebutton/1.4f &&    
      mouseY>height/1.3f-sizebutton/7 && mouseY<height/1.3f+sizebutton/3-sizebutton/7) {
      passwordInput = password1.Text;
      hashing (passwordInput);
      Register();
        
}
}
}
TextBox chatText;
boolean enter;
ArrayList<ChatText> messages = new ArrayList<ChatText>();
int i = 0;
DatabaseText databaseText = new DatabaseText();

public void setupChat() {
  chatText = new TextBox(new PVector(100, height - height / 1080 * 100), new PVector(width-300, height / 1080 * 70), false, true);
  textBoxes.add(chatText);
}

public void chatScreen() {

  usernameBox.visible = false;
  passwordBox.visible = false;
  userTB.visible = false;
  emailTB.visible = false;
  password1.visible = false;
  password2.visible = false;
  chatText.visible = true;
  IPBox.visible = false;
  
  if (frameCount%10==0){
  databaseText.getData();
  }
  for (TextBox t : textBoxes) {
    if (t.visible == false) {
      t.clearText();
    } else {
      t.display();
    }
  }

  if (enter) {
    if (chatText.TextLength > 0) {
      //messages.add(new ChatText(chatText.Text, chatText.TEXTSIZE));
      databaseText.sendData();
      databaseText.getData();
      
      chatText.clearText();
      i += 1;
      enter = false;
    }
  }


  for (ChatText t : messages) {
   text(t.message, 100, height-200-t.pos);
   }

  textMode(CENTER);
  text("Chat", width/2, height/5);
  textMode(CORNER);

  But3 = new Button(width/1.04f, height/25, 100, "close", color(100, 100, 100));
  if (But3.visible) But3.show();
}

class ChatText {
  String message;
  float pos;

  ChatText(String message, float pos) {
    this.message = message;
    this.pos = pos;
  }

  public void display() {
    text(message, 100, pos);
  }
}


String QUERY = "SELECT Brugernavn, Besked FROM beskeder";

java.sql.Statement stmt;
ResultSet rs;
Connection conn;

int newID;


class DatabaseText {

  //String name, text;
  int i;

  
  public void getData() {
    try {
   //   Class.forName("com.mysql.jdbc.Driver");

      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(QUERY);
      
      while(rs.next()){
        messages.add(new ChatText(rs.getString("Brugernavn") + ": " + rs.getString("Besked"), chatText.TEXTSIZE));
        //println(rs.getString("Brugernavn") + ": " + rs.getString("Besked"));
        for (ChatText t : messages){
        t.pos += 5/4*chatText.TEXTSIZE;
      }
        i++;
      }

      conn.close();
    } 
    catch(Exception e) {
      println(e);
    }
  }

  public void sendData() {
    try {
      //Class.forName("com.mysql.jdbc.Driver");

      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt = conn.createStatement();
            

      if (chatText.TextLength != 0) {
        stmt.executeUpdate("INSERT INTO `beskeder` (`Brugernavn`, `Besked`) VALUES ('" + usernameInput + "', '" + chatText.Text + "');");
      }
      

      conn.close();
    } 
    catch(Exception e) {
      println(e);
    }
  }
}
java.sql.Statement stmt2, stmt3, stmt4, stmt5;
ResultSet rs2, rs3, rs4, rs5;
Connection conn2, conn3, conn4, conn5;
int maxID = 0;
int maxID2 = -1;
String test;
String hashedPassword = "testpassword";
String IP = "localhost";
String DB_URL = "jdbc:mysql://localhost:3306/chat_program";
String USER = "test";
String PASS = "test";
public void logincheck() {
  
      try{     
     // String DB_URL = "jdbc:mysql://"+IP+":3306/chat_program";
      hashedPassword = outputString;
      usernameInput = usernameBox.Text;
      String QUERY2 = "SELECT password FROM personer WHERE brugernavn = '"+usernameBox.Text+"';";
      Connection conn2 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt2 = conn2.createStatement();
      ResultSet rs2 = stmt2.executeQuery(QUERY2);

//SELECT password FROM brugernavn == "+usernameBox.Text+":"

      while (rs2.next()) {
          test = rs2.getString("password"); 
        if (test.equals(hashedPassword) == true){
               
          gameState = 2; }
        else{
            
          System.out.print(hashedPassword+"=");
          System.out.print(test);
          loginError.errorType = 4;
             System.out.print("password don't match");
        }
              
      }
      conn2.close();
      if (loginError.errorType != 4)
      {
    loginError.errorType = 5;
      }
    }
    catch(Exception e){
      println(e);  
    }
   
}

public void Register() {
hashing(password1.Text);
if ((userTB.Text == "") || (emailTB.Text == "") || (password1.Text == "") || (password2.Text == ""))
{} 
else if (password1.Text.equals(password2.Text) == true){
  try{
    
      String QUERY3 = "SELECT ID, MAX(ID) FROM personer GROUP BY ID";
     Connection conn3 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt3 = conn3.createStatement(); 
     ResultSet rs3 = stmt3.executeQuery(QUERY3);
     
     while (rs3.next()) {
     maxID = ((int)rs3.getInt("ID"));
     maxID2 = maxID+1;
     
     
      
     
    }
    conn3.close();
  }
  
 
  catch(Exception e){
    println(e);  
  }       
   try {
     hashedPassword = outputString;
      String QUERY4 = ("INSERT INTO personer (ID, brugernavn, password, email) VALUES ('"+maxID2+"', '"+userTB.Text+"', '"+hashedPassword+"', '"+emailTB.Text+"');");
      Connection conn4 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt4 = conn4.createStatement();
      stmt4.executeUpdate(QUERY4);
    conn4.close();
       
}
catch(Exception e){
    println(e);      
  }  

  try{
    
      String QUERY5 = "SELECT ID, MAX(ID) FROM personer GROUP BY ID";
     Connection conn5 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt5 = conn5.createStatement(); 
     ResultSet rs5 = stmt5.executeQuery(QUERY5);
     
     while (rs5.next()) {
     maxID2 = ((int)rs5.getInt("ID"));
         
        
    }
    conn5.close();
  }
  
 
  catch(Exception e){
    println(e);  
  } 
if (maxID2 == maxID){
  registerError.errorType = 6;
}
else{
usernameInput = userTB.Text;
gameState = 2;
}
}
}
  int gameState = 0;

class GameStateManager {

  public void setManagerUp() {
  }

  public void manage() {


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

String outputString;
public void hashing(String Text){
  try {
  MessageDigest md = MessageDigest.getInstance("SHA-256"); 
  
  String inputTekst = Text;
    
  md.update(inputTekst.getBytes());    

  byte[] byteList = md.digest();
  
  StringBuffer hashedValueBuffer = new StringBuffer();
  for (byte b : byteList)hashedValueBuffer.append(hex(b)); 
  
  outputString = hashedValueBuffer.toString();
  //println("Den orindelige tekst: "+ inputTekst);
  //println("SHA-256 værdien af teksten: " +hashedValueBuffer);
  
}
catch (Exception e) {
  //System.out.println("Exception: "+e);
}
}
int myColor = color(255);
int c1, c2;
float n, n1;
TextBox usernameBox;
TextBox passwordBox;
TextBox IPBox;
LoginError loginError = new LoginError();

String usernameInput, passwordInput;


public void setupLoginScreen() {
  usernameBox = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 450), new PVector(width/1920*400, height / 1080 * 70), false, true);
  passwordBox = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 580), new PVector(width/1920*400, height / 1080 * 70), false, true);
  IPBox = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 1000), new PVector(width/1920*600, height / 1080 * 70), false, true);
  
  textBoxes.add(IPBox);
  textBoxes.add(usernameBox);
  textBoxes.add(passwordBox);
}

public void loginScreen() {  

  chatText.visible = false;
  userTB.visible = false;
  emailTB.visible = false;
  password1.visible = false;
  password2.visible = false;
  usernameBox.visible = true;
  passwordBox.visible = true;
  IPBox.visible = false;
  
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


  But1 = new Button(width/2.13f, height/1.5f, 100, "Register", color(100, 100, 100));
  if (But1.visible) But1.show();
  But5 = new Button(width/1.74f, height/1.5f, 100, "Login", color(100, 100, 100));
  if (But5.visible) But5.show();
  /*
  But6 = new Button(width/1.25, height/1.05, 100, "Set IP", color(100, 100, 100));
  if (But6.visible) But6.show();
  */
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
  public void display() {

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
public void menuScreen() {
  textMode(CENTER);
  text("Menu", width/2, height/2);
  textMode(CORNER);
}
TextBox userTB, emailTB, password1, password2;
RegisterError registerError = new RegisterError();

public void setupRegisterScreen() {

  userTB = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 320), new PVector(width/1920*400, height / 1080 * 70), false, false);
  emailTB = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 450), new PVector(width/1920*400, height / 1080 * 70), false, false);
  password1 = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 580), new PVector(width/1920*400, height / 1080 * 70), false, false);
  password2 = new TextBox(new PVector(width/2 - width/1920*200, height / 1080 * 710), new PVector(width/1920*400, height / 1080 * 70), false, false);

  textBoxes.add(userTB);
  textBoxes.add(emailTB);
  textBoxes.add(password1);
  textBoxes.add(password2);
}

public void registerScreen() {
  
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
  
      But2 = new Button(width/1.74f, height/1.3f, 100, "Register", color(100, 100, 100));
      if (But2.visible) But2.show();
      But4 = new Button(width/2.13f, height/1.3f, 100, "Back", color(100,100,100));
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
  public void display(){
    
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
boolean altgr = false;
boolean two = false;
boolean period = false;
boolean AE, OE, AA;
boolean shift;

public class TextBox {

  PVector position, size;
  public int TEXTSIZE = 48;
  public boolean isProtected, visible;

  // COLORS
  public int Background = color(140, 140, 140);
  public int Foreground = color(0, 0, 0);
  public int BackgroundSelected = color(160, 160, 160);
  public int Border = color(30, 30, 30);

  public boolean BorderEnable = false;
  public int BorderWeight = 1;

  public String Text = "";
  public String protectedText = "";
  public int TextLength = 0;

  private boolean selected = false;

  TextBox() {
    // CREATE OBJECT DEFAULT TEXTBOX
  }

  TextBox(PVector position, PVector size, boolean isProtected, boolean visible) {
    this.position = position;
    this.size = size;
    this.isProtected = isProtected;
    this.visible = visible;
  }

  public void display() {

    if (visible) {
      // DRAWING THE BACKGROUND
      if (selected) {
        fill(BackgroundSelected);
      } else {
        fill(Background);
      }

      if (BorderEnable) {
        strokeWeight(BorderWeight);
        stroke(Border);
      } else {
        noStroke();
      }

      rectMode(CORNER);

      rect(position.x, position.y, size.x, size.y);

      // DRAWING THE TEXT ITSELF
      fill(Foreground);
      textSize(TEXTSIZE);
      
      if (isProtected){
      text(protectedText, position.x + (textWidth("a") / 2), position.y + TEXTSIZE);
      } else {
      text(Text, position.x + (textWidth("a") / 2), position.y + TEXTSIZE);  
      }
      
    } else {
    }
  }

  // IF THE KEYCODE IS ENTER RETURN 1
  // ELSE RETURN 0
  public boolean keyWasTyped(char KEY, int KEYCODE) {
    if (selected) {
      if (KEYCODE == (int)BACKSPACE) {
        backSpace();
      } else if (KEYCODE == 32) {
        if (isProtected) {
          addProtection('*');
        } 
        addText(' ');
    } else if (KEYCODE == (int)ENTER) {
      return true;
    } else {
      // CHECK IF THE KEY IS A LETTER OR A NUMBER
      boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
      boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
      boolean isKeyNumber = (KEY >= '0' && KEY <= '9');



      if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
        if (isProtected) {
          addProtection('*');
        }
        addText(KEY);
      }
      if (altgr == true && two == true) {
        if (isProtected) {
          addText('*');
        }
        addText('@');
      }
      if (period == true) {
        if (isProtected) {
          addText('*');
        }
        addText('.');
      }
      /*if (AE == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('æ');
       }
       }
       if (OE == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('ø');
       }
       }
       if (AA == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('å');
       }
       }
       
       if (shift && AE == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('Æ');
       }
       }
       if (shift && OE == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('Ø');
       }
       }
       if (shift && AA == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('Å');
       }
       }*/
    }
  }
  return false;
}

private void addText(char text) {
  // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
  if (textWidth(Text + text) < (size.x -size.x/5)) {
    Text += text;
    TextLength++;
  }
}
private void addProtection(char text) {
  if (textWidth(Text + text) < (size.x - size.x/5)) {
    protectedText += text;
  }
}

private void backSpace() {
  if (TextLength - 1 >= 0) {
    Text = Text.substring(0, TextLength - 1);
    TextLength--;
  }
}

// FUNCTION FOR TESTING IS THE POINT
// OVER THE TEXTBOX
private boolean overBox(int x, int y) {
  if (x >= position.x && x <= position.x + size.x) {
    if (y >= position.y && y <= position.y + size.y) {
      return true;
    }
  }

  return false;
}

public void pressed(int x, int y) {
  if (overBox(x, y)) {
    selected = true;
  } else {
    selected = false;
  }
}

public void clearText() {
  TextLength = 0;
  Text = "";
}
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "ChatProgram" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
