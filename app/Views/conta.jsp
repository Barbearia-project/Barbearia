<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Assets/css/conta.css">
    <title>Conta</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
            
</head>

<body>

    <button onclick="topFunction()" id="myBtn" title="Go to top"> ↑ </button>
    
    <script>
        let mybutton = document.getElementById("myBtn");

    window.onscroll = function () {
        mybutton.style.display = "block";
    };

    mybutton.addEventListener("click", function () {
        window.scrollTo({
            top: 0,
            behavior: "smooth", 
         });
    });
    </script>
    
    
    <header class="head">
        <a class="display-left" href="hoome.html">
            <img src="../Assets/img/logo_header.png" alt="Logo">
            Barbearia
        </a>
        <div class="display-right">

            <a href="agendamento.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
              </svg> Agende um Horário</a>
            <a href="conta.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
              </svg> Conta</a>
            <a href="../config/logout.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"/>
               <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
            </svg> Sair</a>
        </div>
    </header>

    <div class="container">
        
        <div class="title">Gerenciar Conta</div>
        <div class="line"></div>

        <div class="content">
            <div class="info-box">
                <h3>Informações Pessoais</h3>
                <div class="line-inner"></div>

                <%
                    // Obtendo o ID do cliente da sessão
                    String idCliente = session.getAttribute("id_cliente").toString();

                    // Conectando ao banco de dados
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/barba", "root", "");
                    String query = "SELECT nomeCliente, emailCliente, telefoneCliente FROM clientes WHERE id_cliente = ?";
                    PreparedStatement stmt = con.prepareStatement(query);
                    stmt.setInt(1, Integer.parseInt(idCliente));
                    ResultSet rs = stmt.executeQuery();

                    String nome = "";
                    String email = "";
                    String telefone = "";
                    if (rs.next()) {
                        nome = rs.getString("nomeCliente");
                        email = rs.getString("emailCliente");
                        telefone = rs.getString("telefoneCliente");
                    }
                    con.close();
                %>

                <p><strong style="opacity: 0.5;">Usuário</strong> <br><%= nome %></p>
                <p><strong style="opacity: 0.5;">E-mail</strong> <br><%= email %></p>
                <p><strong style="opacity: 0.5;">Telefone</strong> <br><%= telefone %></p>

            </div>
        </div>   
    </div>

    <div class="container">
        <div class="title">Lista de Agendamentos</div>
        <div class="line"></div>

        <div class="content">
            <div class="info-box">
                <h3>Agendamentos</h3>
                <div class="line-inner"></div>

                <%
                    // Consultando os agendamentos do cliente
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/barba", "root", "");
                    String queryAgendamentos = "SELECT a.id_agendamento, a.dataAgendada, a.horario, s.tipoServico, s.preco, p.nomeProfissional " +
                                               "FROM agendamentos a " +
                                               "JOIN servicos s ON a.id_servico = s.id_servico " +
                                               "JOIN profissionais p ON a.id_profissional = p.id_profissional " +
                                               "WHERE a.id_cliente = ?";

                    stmt = con.prepareStatement(queryAgendamentos);
                    stmt.setInt(1, Integer.parseInt(idCliente));
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        String dataAgendada = rs.getString("dataAgendada");
                        String horario = rs.getString("horario");
                        String tipoServico = rs.getString("tipoServico");
                        String preco = rs.getString("preco");
                        String nomeProfissional = rs.getString("nomeProfissional");
                %>

                <p><strong>Cliente:</strong> <%= nome %></p>
                <p><strong>Data:</strong> <%= dataAgendada %></p>
                <p><strong>Horário:</strong> <%= horario %></p>
                <p><strong>Tipo de Serviço:</strong> <%= tipoServico %></p>
                <p><strong>Preço:</strong> R$ <%= preco %></p>
                <p><strong>Profissional:</strong> <%= nomeProfissional %></p>
                <div class="line-inner"></div>

                <%
                    }
                    con.close();
                %>

            </div>
        </div>
    </div>

</body>
</html>
