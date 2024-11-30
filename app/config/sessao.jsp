<%@ page language="java" import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Verificar se o usuário já está autenticado
    HttpSession sessao = request.getSession(false); // Tenta obter a sessão atual (não cria uma nova)

    // Se não existir uma sessão ou se o usuário não estiver logado
    if (sessao == null || sessao.getAttribute("emailUsuario") == null) {
        // Usuário não autenticado, redireciona para a página de login
        response.sendRedirect(request.getContextPath() + "/app/Views/login.html");
        return; // Termina o processamento da página
    }

    // Se o usuário estiver autenticado, você pode acessar as informações da sessão
    String nomeUsuario = (String) sessao.getAttribute("nomeUsuario");
    String emailUsuario = (String) sessao.getAttribute("emailUsuario");
    Integer idClienteSessao = (Integer) sessao.getAttribute("idCliente");

    if (idClienteSessao != null) {
        out.println("<h2>Bem-vindo, " + nomeUsuario + "!</h2>");
        out.println("<p>Email: " + emailUsuario + "</p>");
        out.println("<p>ID: " + idClienteSessao + "</p>");
    } else {
        out.println("<p style='color:red;'>Erro: ID do cliente não encontrado na sessão.</p>");
    }
%>
