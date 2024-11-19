
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="config.DatabaseConnection" %>

<html>
<head>
    <title>Teste de Conexão</title>
</head>
<body>
    <h1>Teste de Conexão com o Banco de Dados</h1>
    <%
        try {
            
            Connection connection = DatabaseConnection.getConnection();

            
            if (connection != null) {
                out.println("<p>Conexão realizada com sucesso!</p>");
            } else {
                out.println("<p>Erro ao realizar conexão.</p>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            out.println("<p>Erro de conexão: " + e.getMessage() + "</p>");
        }
    %>
</body>
</html>
