<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
    <%
        // Verifica e invalida a sessão
        HttpSession sessao = request.getSession(false);
        if (sessao != null) {
            // Remove atributos específicos da sessão
            sessao.removeAttribute("nomeUsuario");
            sessao.removeAttribute("emailUsuario");
            
            // Invalida a sessão completamente
            sessao.invalidate();
        }
        
        // Redireciona para a página de login
        response.sendRedirect("../Views/hoome.jsp");
    %>
</body>
</html>