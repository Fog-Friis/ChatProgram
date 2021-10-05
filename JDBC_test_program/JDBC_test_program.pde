//import com.mysql.cj.*;
import java.sql.*;

int newID;
float bruh;

boolean d = false;

String DB_URL = "jdbc:mysql://localhost/opgave_1_database";
String USER = "root";
String PASS = "";
String QUERY = "SELECT ID_personer, navn, efternavn, telefonnummer, email, yndlingstal FROM personer";

java.sql.Statement stmt;
ResultSet rs;
Connection conn;

void setup()
{
  size(500, 300);
  // Open a connection

  try {
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(QUERY);

    //Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    //java.sql.Statement stmt = conn.createStatement();
    //ResultSet rs = stmt.executeQuery(QUERY);

    // Extract data from result set
    while (rs.next()) {
      // Retrieve by column name

      System.out.print("ID: " + rs.getInt("ID_personer"));
      System.out.print(", fornavn: " + rs.getString("navn"));
      System.out.print(", efternavn: " + rs.getString("efternavn"));
      System.out.println(", telefonnummer: " + rs.getString("telefonnummer"));
      System.out.print(", email: " + rs.getString("email"));
      System.out.println(", yndlingstal: " + rs.getFloat("yndlingstal"));

      newID = rs.getInt("ID_personer")+1;
    }
  }
  catch(Exception e)
  {
    println(e);
  }
  /*
      } catch (SQLException e) {
   e.printStackTrace();
   } */
  //}
  //println(newID);
}

void draw() {
  
  background(255);
  fill(0,0,0);
  text(millis() / 1000, width/2, height / 2);
  text(round(frameRate) + " fps", 20, 20);

  if (frameCount%1==0) {
    try {

      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt = conn.createStatement();

      //if (d == true) {

      //println("d was pressed");



      //stmt.executeUpdate("INSERT INTO personer " + "Values (" + newID + ", 'jens', 'vejmand', '54657623', 'jensvejmand@gmail.com', 20.0)");

      stmt.executeUpdate("UPDATE personer \n" + "SET yndlingstal = " + millis() + "\nWHERE ID_Personer = 4;");
      
      ResultSet rs = stmt.executeQuery("SELECT yndlingstal FROM personer WHERE ID_Personer = 4;");
      
      if (rs.next()){
        println(rs.getInt("yndlingstal") / 1000);
      }
      
      

      d = false;

      //println("INSERT INTO personer " + "Values (" + newID + ", 'jens', 'vejmand', '54657623', 'jensvejmand@gmail.com', 20.0)");
      //}

      conn.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
}

void keyPressed() {
  if (key == 'd' || key == 'D') d = true;
}
