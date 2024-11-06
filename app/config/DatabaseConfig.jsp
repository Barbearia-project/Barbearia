<%@ page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String database = "barba";
    String url = "jdbc:mysql://localhost:3306/" + database;
    String username = "root";
    String password = "";
    String driver = "com.mysql.jdbc.Driver";

    try {
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(url, username, password);
        
        if (connection != null) {
            out.println("Conexão realizada com sucesso");
        }
    } catch (Exception e) {
        out.println("Erro de conexão: " + e.getMessage());
    }
%>