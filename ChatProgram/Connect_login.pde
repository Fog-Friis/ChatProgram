java.sql.Statement stmt2;
ResultSet rs2;
Connection conn2;

String DB_URL2 = "jdbc:mysql://localhost/chat_program";
String QUERY2 = "SELECT ID,brugernavn, password, email FROM personer";
String QUERY3 = "SELECT ID,brugernavn, password, email FROM personer";
void logincheck() {
if ((usernameBox.Text == "") || (passwordBox.Text == ""))
{} 
else {

try{
         String QUERY2 = "SELECT ID,brugernavn, password, email FROM personer WHERE brugernavn = "+usernameBox.Text+";";
         String QUERY3 = "SELECT password FROM personer WHERE "+usernameBox.Text+" = brugernavn;";
         String QUERY4 = "SELECT password FROM personer WHERE brugernavn + "+usernameBox.Text+";";
         Connection conn2 = DriverManager.getConnection(DB_URL2, USER, PASS);
         java.sql.Statement stmt2 = conn2.createStatement();
         ResultSet rs2 = stmt2.executeQuery(QUERY4);

//SELECT password FROM brugernavn == "+usernameBox.Text+":"
        while (rs2.next()) {
      //println("test");
            // Retrieve by column name
           // System.out.print("ID: " + rs.getInt("id"));
           println(rs2.getString("password"));
           /*
             if((passwordBox.Text) == (rs2.getString("password"))){
             gameState += 1;
             }
             else {
             System.out.print("password don't match");
             }
             */
          
         }
          conn2.close();
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
