<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agendar Serviço</title>
    <link rel="stylesheet" href="../Assets/css/agendamento.css">
</head>
<body>
<h2>Confirmação de Agendamento</h2>
<%
    String database = "barba";
    String url = "jdbc:mysql://localhost:3306/" + database + "?useSSL=false&serverTimezone=UTC";
    String username = "root";
    String password = "";
    String driver = "com.mysql.jdbc.Driver";

    Connection connection = null;
    PreparedStatement statement = null;

    HttpSession sessao = request.getSession();
    String idClienteSessao = (String) sessao.getAttribute("id_cliente");

    String dataAgendada = request.getParameter("dataAgendada");
    String id_cliente = request.getParameter("id_cliente");
    String horario = request.getParameter("horario");
    String id_servico = request.getParameter("id_servico");
    String id_profissional = request.getParameter("id_profissional");
    String id_pagamento = request.getParameter("id_pagamento");

    try {
        Class.forName(driver);
        connection = DriverManager.getConnection(url, username, password);

        String query = "INSERT INTO agendamentos (id_cliente, dataAgendada, horario, id_servico, id_profissional, id_pagamento) VALUES (?, ?, ?, ?, ?, ?)";
        statement = connection.prepareStatement(query);

        statement.setString(1, id_cliente);
        statement.setString(2, dataAgendada);
        statement.setString(3, horario);
        statement.setString(4, id_servico);
        statement.setString(5, id_profissional);
        statement.setString(6, id_pagamento);

        int rowsInserted = statement.executeUpdate();

        if (rowsInserted > 0) {
            out.println("<p style='color:green;'>Agendamento realizado com sucesso!</p>");
        } else {
            out.println("<p style='color:red;'>Erro ao realizar o agendamento. Tente novamente.</p>");
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Erro ao conectar com o banco de dados: " + e.getMessage() + "</p>");
    } finally {
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }
%>
</body>
</html>
