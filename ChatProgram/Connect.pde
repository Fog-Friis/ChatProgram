import java.sql.*;

<<<<<<< HEAD
String DB_URL = "jdbc:mysql://localhost/beskeder";
String USER = "root";
String PASS = "";
String QUERY = "SELECT Brugernavn, Besked FROM alle";

java.sql.Statement stmt;
ResultSet rs;
Connection conn;

int newID;


class DatabaseText {

  //String name, text;
  int i;

  DatabaseText(/*String name, String text*/) {
    //this.name = name;
    //this.text = text;
  }
  
  void getData() {
    try {
      Class.forName("com.mysql.jdbc.Driver");

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

  void sendData() {
    try {
      //Class.forName("com.mysql.jdbc.Driver");

      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt = conn.createStatement();
            

      if (chatText.TextLength != 0) {
        stmt.executeUpdate("INSERT INTO `alle` (`Brugernavn`, `Besked`) VALUES ('" + usernameInput + "', '" + chatText.Text + "');");
      }
      

      conn.close();
    } 
    catch(Exception e) {
      println(e);
    }
  }
=======

java.sql.Statement stmt;
ResultSet rs;
Connection conn;

String DB_URL = "jdbc:mysql://localhost/chat_program";
String USER = "root";
String PASS = "";
String QUERY = "SELECT ID,brugernavn, password, email FROM personer";

void logincheck() {
if ((usernameBox.Text == "") || (passwordBox.Text == ""))
{} 
else {

try{
 
         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
         java.sql.Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT password FROM brugernavn ="+usernameBox.Text+":");

while (rs.next()) {
  //println("test");
            // Retrieve by column name
           // System.out.print("ID: " + rs.getInt("id"));
           println(rs.getString("password"));
             if((passwordBox.Text) == (rs.getString("password"))){
             gameState += 1;
             }
             
            //System.out.print(", username: " + rs.getString("username"));
         //   System.out.print(", password: " + rs.getString("password"));
            //System.out.println(", username: " + rs.getString("username"));
         }
         
               }
      catch(Exception e)
       {
      println(e);
      
      }
     
}
}
void Register() {
if ((userTB.Text == "") || (emailTB.Text == "") || (password1.Text == "") || (password2.Text == ""))
{} 
else {
  if ((password1.Text) == (password2.Text)){}
  else{
  
  
  }


}
>>>>>>> 7f0f29cebeb5010f6a71cad9638e91c6481d4b90
}
