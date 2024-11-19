package app.Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import app.model.ClienteCadastro;

public class ClienteController {
    private Connection conn;

    public ClienteController(Connection conn) {
        this.conn = conn;
    }

    public boolean adicionarCliente(ClienteCadastro cadastro) throws SQLException {
        String sql = "INSERT INTO clientes (nome, email, senha, telefone) VALUES (?, ?, ?, ?)";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            // Validação básica
            if (cadastro == null) {
                return false;
            }
            
            // Prepara a declaração SQL
            stmt.setString(1, cadastro.getNome());
            stmt.setString(2, cadastro.getEmail());
            stmt.setString(3, cadastro.getSenha());
            stmt.setString(4, cadastro.getTelefone());
            
            // Executa a inserção e retorna true se pelo menos uma linha foi afetada
            return stmt.executeUpdate() > 0;
        }
    }

    // Método para verificar se email já existe
    public boolean emailJaExiste(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM clientes WHERE email = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            var rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        }
    }

    // Método para buscar cliente por email
    public ClienteCadastro buscarPorEmail(String email) throws SQLException {
        String sql = "SELECT * FROM clientes WHERE email = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            var rs = stmt.executeQuery();
            
            if (rs.next()) {
                return new ClienteCadastro(
                    rs.getLong("id"),
                    rs.getString("nome"),
                    rs.getString("email"),
                    rs.getString("senha"),
                    rs.getString("telefone")
                );
            }
            return null;
        }
    }

    // Método para atualizar cliente
    public boolean atualizarCliente(ClienteCadastro cliente) throws SQLException {
        String sql = "UPDATE clientes SET nome = ?, email = ?, telefone = ? WHERE id = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getEmail());
            stmt.setString(3, cliente.getTelefone());
            stmt.setLong(4, cliente.getId());
            
            return stmt.executeUpdate() > 0;
        }
    }

    // Método para deletar cliente
    public boolean deletarCliente(Long id) throws SQLException {
        String sql = "DELETE FROM clientes WHERE id = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

    // Método para fechar a conexão
    public void fecharConexao() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}