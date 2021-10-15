java.sql.Statement stmt2, stmt3;
ResultSet rs2, rs3;
Connection conn2, conn3;

String hashedPassword = "din mor";

String DB_URL = "jdbc:mysql://localhost:3306/chat_program";
String USER = "root";
String PASS = "";
String QUERY2 = "SELECT ID,brugernavn, password, email FROM personer";
String QUERY3 = "INSERT ID,brugernavn, password, email FROM personer";
void logincheck() {

if ((usernameBox.Text == "") || (passwordBox.Text == ""))
{} 
else {

try{     
         String QUERY2 = "SELECT password FROM personer WHERE brugernavn = '"+usernameBox.Text+"';";
         Connection conn2 = DriverManager.getConnection(DB_URL, USER, PASS);
         java.sql.Statement stmt2 = conn2.createStatement();
         ResultSet rs2 = stmt2.executeQuery(QUERY2);

//SELECT password FROM brugernavn == "+usernameBox.Text+":"

          while (rs2.next()) {
      //println("test");
           
           //println(rs2.getString("password"));
           
             if (rs2.getString("password") == passwordInput ){
             gameState += 2;
             }
             else if (rs2.getString("password") != passwordInput )
             {
               
               hashedPassword = outputString;
               System.out.print(passwordInput);
               System.out.print(rs2.getString("password"));
               loginError.errorType = 4;
             //System.out.print("password don't match");
             }
             else{
             System.out.print("Shits fucked");
             }
          
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
    
try {
    String QUERY3 = "SELECT MAX(ID) FROM personer;";
      Connection conn3 = DriverManager.getConnection(DB_URL, USER, PASS);
         java.sql.Statement stmt3 = conn3.createStatement();
         ResultSet rs3 = stmt3.executeQuery(QUERY3);
         while (rs3.next()) {
          System.out.print(rs3.getInt("ID"));
         }

          conn2.close();
               }
      catch(Exception e)
       {

  println(e);
       }

}
}
}
