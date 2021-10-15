import java.sql.*;


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
}
