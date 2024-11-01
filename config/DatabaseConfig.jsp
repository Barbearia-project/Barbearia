<%@page linguage="java" import "java.sql.*"%>
<%

String database = "Barbearia";
String endereco  = "jdbc:mysql://localhost:3306/";
String username = "root";
String password = "";


String Driver = "com.mysql.jdbc.Driver";

Class.forName(Driver);

Connection connection;


connection =  DriverManager.getConnection(endereco , database, username, password);


%>