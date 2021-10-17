java.sql.Statement stmt2, stmt3, stmt4, stmt5;
ResultSet rs2, rs3, rs4, rs5;
Connection conn2, conn3, conn4, conn5;
int maxID = 0;
int maxID2 = -1;
String test;
String hashedPassword = "testpassword";
String IP = "localhost";
String DB_URL = "jdbc:mysql://localhost:3306/chat_program";
String USER = "test";
String PASS = "test";
void logincheck() {
  
      try{     
      String DB_URL = "jdbc:mysql://"+IP+":3306+/chat_program";
      hashedPassword = outputString;
      usernameInput = usernameBox.Text;
      String QUERY2 = "SELECT password FROM personer WHERE brugernavn = '"+usernameBox.Text+"';";
      Connection conn2 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt2 = conn2.createStatement();
      ResultSet rs2 = stmt2.executeQuery(QUERY2);

//SELECT password FROM brugernavn == "+usernameBox.Text+":"

      while (rs2.next()) {
          test = rs2.getString("password"); 
        if (test.equals(hashedPassword) == true){
               
          gameState = 2; }
        else{
            
          System.out.print(hashedPassword+"=");
          System.out.print(test);
          loginError.errorType = 4;
             System.out.print("password don't match");
        }
              
      }
      conn2.close();
      if (loginError.errorType != 4)
      {
    loginError.errorType = 5;
      }
    }
    catch(Exception e){
      println(e);  
    }
   
}

void Register() {
hashing(password1.Text);
if ((userTB.Text == "") || (emailTB.Text == "") || (password1.Text == "") || (password2.Text == ""))
{} 
else if (password1.Text.equals(password2.Text) == true){
  try{
    
      String QUERY3 = "SELECT ID, MAX(ID) FROM personer GROUP BY ID";
     Connection conn3 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt3 = conn3.createStatement(); 
     ResultSet rs3 = stmt3.executeQuery(QUERY3);
     
     while (rs3.next()) {
     maxID = ((int)rs3.getInt("ID"));
     maxID2 = maxID+1;
     
     
      
     
    }
    conn3.close();
  }
  
 
  catch(Exception e){
    println(e);  
  }       
   try {
     hashedPassword = outputString;
      String QUERY4 = ("INSERT INTO personer (ID, brugernavn, password, email) VALUES ('"+maxID2+"', '"+userTB.Text+"', '"+hashedPassword+"', '"+emailTB.Text+"');");
      Connection conn4 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt4 = conn4.createStatement();
      stmt4.executeUpdate(QUERY4);
    conn4.close();
       
}
catch(Exception e){
    println(e);      
  }  

  try{
    
      String QUERY5 = "SELECT ID, MAX(ID) FROM personer GROUP BY ID";
     Connection conn5 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt5 = conn5.createStatement(); 
     ResultSet rs5 = stmt5.executeQuery(QUERY5);
     
     while (rs5.next()) {
     maxID2 = ((int)rs5.getInt("ID"));
         
        
    }
    conn5.close();
  }
  
 
  catch(Exception e){
    println(e);  
  } 
if (maxID2 == maxID){
  registerError.errorType = 6;
}
else{
usernameInput = userTB.Text;
gameState = 2;
}
}
}
