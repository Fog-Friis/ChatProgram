TextBox chatText;
boolean enter;
ArrayList<ChatText> messages = new ArrayList<ChatText>();
int i = 0;
DatabaseText databaseText = new DatabaseText();

void setupChat() {
  chatText = new TextBox(new PVector(100, height - height / 1080 * 100), new PVector(width-300, height / 1080 * 70), false, true);
  textBoxes.add(chatText);
}

void chatScreen() {

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

  But3 = new Button(width/1.04, height/25, 100, "close", color(100, 100, 100));
  if (But3.visible) But3.show();
}

class ChatText {
  String message;
  float pos;

  ChatText(String message, float pos) {
    this.message = message;
    this.pos = pos;
  }

  void display() {
    text(message, 100, pos);
  }
}
