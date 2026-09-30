package org.example.Model;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    public boolean cadastrar(Usuario usuario){
        String sql = """
                INSERT INTO usuarios
                (login, senha) VALUES(?,?)""";

        String senhaHash=BCrypt.hashpw(usuario.getSenha(),
                BCrypt.gensalt(12));
        try(Connection conexao = Conexao.conectar();
        PreparedStatement stmt = conexao.prepareStatement(sql)){
            stmt.setString(1,usuario.getLogin());
            stmt.setString(2,senhaHash);
            stmt.executeUpdate();
            return true;
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean inativarUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET status = false WHERE id = ?";

        try (Connection conexao = Conexao.conectar();
             PreparedStatement stmt = conexao.prepareStatement(sql)) {

            stmt.setInt(1, usuario.getId());
            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public Usuario consultarUsuario (String login){
        String sql = """
                SELECT if, login, senha, status
                FROM usuarios
                WHERE login =?
                """;
        try (Connection conexao  = Conexao.conectar();
        PreparedStatement stmt = conexao.prepareStatement(sql)){
            stmt.setString(1, login);

            ResultSet result = stmt.executeQuery();
            if(result.next()){
                return new Usuario(
                        result.getInt("id"),
                        result.getString("login"),
                        result.getString("senha"),
                        result.getBoolean("status")
                );
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return null;
    }
    public static boolean autenticar(String login, String senha) {
        return false;
    }
}
