<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Agendamentos</title>
    <link rel="stylesheet" href="../Assets/css/agendamentos.css">
</head>
<body>

    <!-- Incluindo a consulta -->
    <jsp:include page="../config/AgendamentoQuery.jsp" />

    <ul id="listaAgendamentos"></ul>

    <script>
        // Recupera o JSON do atributo "agendamentos" vindo do JSP
        var agendamentos = JSON.parse('<%= request.getAttribute("agendamentos") %>'.replace(/&quot;/g, '"'));

        // Função para exibir os agendamentos na lista
        function mostrarAgendamentos() {
            var lista = document.getElementById('listaAgendamentos');
            agendamentos.forEach(function (agendamento) {
                var li = document.createElement('li');
                li.innerHTML = "Cliente: " + agendamento.nomeCliente + "<br>" +
                    "Data: " + agendamento.dataAgendada + "<br>" +
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
