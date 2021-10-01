import java.sql.*;
import ControlP5.*;

String DB_URL = "jdbc:mysql://localhost/chat_program";
String USER = "root";
String PASS = "";
String QUERY = "SELECT id, username, password, email FROM data";
