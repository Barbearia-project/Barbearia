<%@ page language="java" import="java.sql.*, org.json.JSONArray, org.json.JSONObject" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meus Agendamentos</title>
</head>
<body>
    <h2 style="text-align:center;">Meus Agendamentos</h2>

    <%
        // Verificar sessão
        HttpSession sessao = request.getSession(false);
        if (sessao == null || sessao.getAttribute("emailUsuario") == null) {
            response.sendRedirect("login.html");
            return;
        }

        String emailUsuario = (String) sessao.getAttribute("emailUsuario");

        // Configurações do banco de dados
        String database = "barba";
        String url = "jdbc:mysql://localhost:3306/" + database + "?useSSL=false&serverTimezone=UTC";
        String username = "root";
        String password = "";
        String driver = "com.mysql.jdbc.Driver";

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        JSONArray jsonArray = new JSONArray();

        try {
            // Conectar ao banco de dados
            Class.forName(driver);
            connection = DriverManager.getConnection(url, username, password);

            // Consulta com JOIN e filtro por email do cliente
            String sql = "SELECT agendamentos.horario, agendamentos.dataAgendada, " +
                         "clientes.nomeCliente, profissionais.nomeProfissional, " +
                         "servicos.tipoServico, servicos.preco, servicos.tempoEstimado " +
                         "FROM agendamentos " +
                         "INNER JOIN clientes ON agendamentos.id_cliente = clientes.id_cliente " +
                         "INNER JOIN profissionais ON agendamentos.id_profissional = profissionais.id_profissional " +
                         "INNER JOIN servicos ON agendamentos.id_servico = servicos.id_servico " +
                         "WHERE clientes.emailCliente = ?";

            statement = connection.prepareStatement(sql);
            statement.setString(1, emailUsuario);
            resultSet = statement.executeQuery();

            // Construir o JSON com os resultados
            while (resultSet.next()) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("nomeCliente", resultSet.getString("nomeCliente"));
                jsonObject.put("dataAgendada", resultSet.getString("dataAgendada"));
                jsonObject.put("horario", resultSet.getString("horario"));
                jsonObject.put("tipoServico", resultSet.getString("tipoServico"));
                jsonObject.put("preco", resultSet.getString("preco"));
                jsonObject.put("tempoEstimado", resultSet.getString("tempoEstimado"));
                jsonObject.put("nomeProfissional", resultSet.getString("nomeProfissional"));
                jsonArray.put(jsonObject);
            }

            // Exibir o JSON no HTML
            out.println("<script>var agendamentos = " + jsonArray.toString() + ";</script>");

        } catch (Exception e) {
            out.println("<p style='color:red;'>Erro: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                out.println("<p style='color:red;'>Erro ao fechar recursos: " + e.getMessage() + "</p>");
            }
        }
    %>

    <ul id="listaAgendamentos"></ul>

    <script>
        // Função para exibir os agendamentos na lista
        function mostrarAgendamentos() {
            var lista = document.getElementById('listaAgendamentos');
            if (agendamentos.length === 0) {
                lista.innerHTML = "<li>Você não possui agendamentos.</li>";
                return;
            }
            
            agendamentos.forEach(function(agendamento) {
                var li = document.createElement('li');
                li.innerHTML = "Data: " + agendamento.dataAgendada + "<br>" +
                               "Horário: " + agendamento.horario + "<br>" +
                               "Tipo de Serviço: " + agendamento.tipoServico + "<br>" +
                               "Preço: R$ " + agendamento.preco + "<br>" +
                               "Tempo Estimado: " + agendamento.tempoEstimado + " minutos<br>" +
                               "Profissional: " + agendamento.nomeProfissional;
                lista.appendChild(li);
            });
        }

        // Chamar a função para mostrar os agendamentos
        mostrarAgendamentos();
    </script>
</body>
</html>
