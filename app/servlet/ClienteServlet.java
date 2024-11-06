
package app.servlet;

import app.Controller.ClienteController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.model.ClienteCadastro;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet("/cliente")
public class ClienteServlet extends HttpServlet {

    private ClienteController clienteController;
    private Connection conexao;

    @Override
    public void init() throws ServletException {
        try {
            // Leitura das configurações de conexão de um arquivo de configuração (ex: properties)
            String url = "jdbc:mysql://localhost:3306/ barba";  // Alterar para sua URL do banco
            String usuario = "root";  // Alterar para seu usuário de banco
            String senha = "";  // Alterar para sua senha de banco
            // Carrega o driver JDBC
            Class.forName("com.mysql.jdbc.Driver");
            
            // Estabelece a conexão com o banco de dados
            conexao = DriverManager.getConnection(url, usuario, senha);
            clienteController = new ClienteController(conexao);
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Erro ao inicializar a conexão com o banco de dados", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Recupera os parâmetros do formulário
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String telefone = request.getParameter("telefone");

            // Validação básica dos campos
            if (nome == null || nome.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                senha == null || senha.trim().isEmpty() ||
                telefone == null || telefone.trim().isEmpty()) {
                
                response.sendRedirect("../Views/erro.jsp?msg=Campos obrigatórios não preenchidos");
                return;
            }

            // Cria o objeto cliente
            ClienteCadastro cliente = new ClienteCadastro(nome, email, senha, telefone);

            // Tenta salvar o cliente
            if (clienteController.adicionarCliente(cliente)) {
                response.sendRedirect("../Views/sucesso.jsp");  // Redireciona para a tela de sucesso
            } else {
                response.sendRedirect("../Views/erro.jsp?msg=Erro ao cadastrar cliente");
            }

        } catch (Exception e) {
            // Log do erro (você pode implementar um sistema de logging adequado)
            e.printStackTrace();
            response.sendRedirect("../Views/erro.jsp?msg=Erro interno do servidor");
        }
    }

    @Override
    public void destroy() {
        try {
            // Fecha a conexão com o banco de dados
            if (conexao != null && !conexao.isClosed()) {
                conexao.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
