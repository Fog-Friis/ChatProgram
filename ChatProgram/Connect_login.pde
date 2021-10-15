import java.sql.*;


java.sql.Statement stmt2;
ResultSet rs2;
Connection conn2;

String DB_URL2 = "jdbc:mysql://localhost/chat_program";
String USER2 = "root";
String PASS2 = "";
String QUERY2 = "SELECT ID,brugernavn, password, email FROM personer";

void logincheck() {
if ((usernameBox.Text == "") || (passwordBox.Text == ""))
{} 
else {

try{
 
         Connection conn2 = DriverManager.getConnection(DB_URL, USER, PASS);
         java.sql.Statement stmt2 = conn.createStatement();
         ResultSet rs2 = stmt.executeQuery("SELECT password FROM brugernavn ="+usernameBox.Text+":");

        while (rs.next()) {
      //println("test");
            // Retrieve by column name
           // System.out.print("ID: " + rs.getInt("id"));
           println(rs2.getString("password"));
             if((passwordBox.Text) == (rs2.getString("password"))){
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
