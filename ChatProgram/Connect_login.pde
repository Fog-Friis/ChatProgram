java.sql.Statement stmt2;
ResultSet rs2;
Connection conn2;

String DB_URL = "jdbc:mysql://localhost:3306/chat_program";
String USER = "root";
String PASS = "";
String QUERY2 = "SELECT ID,brugernavn, password, email FROM personer";
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
           
             if (passwordBox.Text == rs2.getString("password")){
             gameState += 2;
             }
             else {
               System.out.print(passwordBox.Text);
               System.out.print(rs2.getString("password"));
               loginError.errorType = 4;
             //System.out.print("password don't match");
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
  
  
  }


}
}
