import java.sql.*;

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
}
