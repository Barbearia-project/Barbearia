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
<h2>Formulário de Agendamento</h2>
<%
    // Conexão com o banco de dados
    String database = "barba";
    String url = "jdbc:mysql://localhost:3306/" + database + "?useSSL=false&serverTimezone=UTC";
    String username = "root";
    String password = "";
    String driver = "com.mysql.jdbc.Driver";

    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    ResultSet resultSetProf = null;

    HttpSession sessao = request.getSession();
    String nomeClienteSessao = (String) sessao.getAttribute("nomeUsuario");
    String idClienteSessao = (String) sessao.getAttribute("id_cliente");

    try {
        Class.forName(driver);
        connection = DriverManager.getConnection(url, username, password);

        // Consulta para obter serviços
        String queryServicos = "SELECT id_servico, tipoServico FROM servicos";
        statement = connection.prepareStatement(queryServicos);
        resultSet = statement.executeQuery();

        // Consulta para obter profissionais
        String queryProfissionais = "SELECT id_profissional, nomeProfissional FROM profissionais";
        PreparedStatement statementProf = connection.prepareStatement(queryProfissionais);
        resultSetProf = statementProf.executeQuery();
%>

<form action="../config/agenda.jsp" method="POST">
    <!-- Campo Cliente -->
    <label for="cliente">Cliente:</label><br>
    <input type="text" id="cliente" name="nomeCliente" value="<%= nomeClienteSessao %>" readonly>
    <input type="hidden" name="id_cliente" value="<%= idClienteSessao %>"><br><br>

    <!-- Campo Data -->
    <label for="data">Data:</label><br>
    <input type="date" id="data" name="dataAgendada" required><br><br>

    <!-- Campo Hora -->
    <label for="hora">Hora:</label><br>
    <input type="time" id="hora" name="horario" required><br><br>

    <!-- Campo Serviço -->
    <label for="servico">Serviço:</label><br>
    <select id="servico" name="id_servico" required>
        <option value="">Selecione um serviço</option>
        <% while (resultSet.next()) { %>
            <option value="<%= resultSet.getInt("id_servico") %>">
                <%= resultSet.getString("tipoServico") %>
            </option>
        <% } %>
    </select><br><br>

    <!-- Campo Profissional -->
    <label for="profissional">Profissional:</label><br>
    <select id="profissional" name="id_profissional" required>
        <option value="">Selecione um profissional</option>
        <% while (resultSetProf.next()) { %>
            <option value="<%= resultSetProf.getInt("id_profissional") %>">
                <%= resultSetProf.getString("nomeProfissional") %>
            </option>
        <% } %>
    </select><br><br>

    <!-- Método de Pagamento -->
    <label class="">Método de Pagamento:</label><br>
    <input type="radio" name="id_pagamento" value="1" checked> Dinheiro<br>
    <input type="radio" name="id_pagamento" value="2"> Cartão<br>
    <input type="radio" name="id_pagamento" value="3"> PIX<br><br>

    <input type="submit" value="Agendar">
</form>

<%
    } catch (Exception e) {
        out.println("<p style='color:red;'>Erro ao carregar dados: " + e.getMessage() + "</p>");
    } finally {
        if (resultSet != null) resultSet.close();
        if (resultSetProf != null) resultSetProf.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }
%>
</body>
</html>
