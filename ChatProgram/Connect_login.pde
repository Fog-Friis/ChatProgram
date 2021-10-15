java.sql.Statement stmt2, stmt3;
ResultSet rs2, rs3;
Connection conn2, conn3;
String test;
String hashedPassword = "din mor";

String DB_URL = "jdbc:mysql://localhost:3306/database";
String USER = "root";
String PASS = "";
String QUERY2 = "SELECT ID,brugernavn, password, email FROM personer";
String QUERY3 = "INSERT ID,brugernavn, password, email FROM personer";
void logincheck() {

  if ((usernameBox.Text == "") || (passwordBox.Text == ""))
  {} 
  else {
    try{     
      hashedPassword = outputString;
      String QUERY2 = "SELECT password FROM personer WHERE brugernavn = '"+usernameBox.Text+"';";
      Connection conn2 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt2 = conn2.createStatement();
      ResultSet rs2 = stmt2.executeQuery(QUERY2);

//SELECT password FROM brugernavn == "+usernameBox.Text+":"

      while (rs2.next()) {
      //println("test");
           
           //println(rs2.getString("password"));
        test = ((String)rs2.getString("password")); 
        if (test.equals(hashedPassword) == true){
               
          gameState = 2; }
        else{
            
          System.out.print(hashedPassword+"=");
          System.out.print(test);
          loginError.errorType = 4;
             //System.out.print("password don't match");
            
        }
               
             
             
              
      }
      conn2.close();
    }
    catch(Exception e){
      println(e);  
    }
  }
}

void Register() {
if ((userTB.Text == "") || (emailTB.Text == "") || (password1.Text == "") || (password2.Text == ""))
{} 
else {
  try{
    if ((password1.Text) == (password2.Text)){
      hashedPassword = outputString;
      String QUERY2 = "INSERT INTO personer (ID, brugernavn, password, email) VALUES (MAX(ID)+1, "+userTB.Text+", "+hashedPassword+", "+emailTB.Text+");";
      Connection conn2 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt2 = conn2.createStatement();
      ResultSet rs2 = stmt2.executeQuery(QUERY2);
    
    }
    conn2.close();
  }
  catch(Exception e){
    println(e);  
  }       
}
}
