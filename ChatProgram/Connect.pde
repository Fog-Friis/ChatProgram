import java.sql.*;

String QUERY = "SELECT Brugernavn, Besked FROM beskeder";

java.sql.Statement stmt;
ResultSet rs;
Connection conn;

int newID;


class DatabaseText {

  //String name, text;
  int i;

  
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
        stmt.executeUpdate("INSERT INTO `beskeder` (`Brugernavn`, `Besked`) VALUES ('" + usernameInput + "', '" + chatText.Text + "');");
      }
      

      conn.close();
    } 
    catch(Exception e) {
      println(e);
    }
  }
}
