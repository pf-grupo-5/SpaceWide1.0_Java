package dao;

import classes.Usuario;
import static dao.Dao.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {

    public static Usuario getUsuarioById(int id) {
        Usuario usuario = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from usuario where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAcesso(rs.getString("acesso"));
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return usuario;
    }

    public static int editarUsuario(Usuario usuario) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE usuario SET nome=?, email=?, acesso=? WHERE id=?");
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getEmail());
            ps.setString(3, usuario.getAcesso());
            ps.setInt(4, usuario.getId());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static List<Usuario> getUsuarios(int inicio, int total) {
        List<Usuario> list = new ArrayList<Usuario>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario ORDER BY id LIMIT " + (inicio - 1) + " ," + total);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAcesso(rs.getString("acesso"));
                usuario.setEstado(rs.getString("estado"));
                list.add(usuario);
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return list;
    }
    
    public static List<Usuario> getUsuariosArtistas(int inicio, int total) {
        List<Usuario> list = new ArrayList<Usuario>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario ORDER BY id where acesso = 'artista' ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAcesso(rs.getString("acesso"));
                usuario.setEstado(rs.getString("estado"));
                list.add(usuario);
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return list;
    }
    
    public static List<Usuario> getUsuariosClientes(int inicio, int total) {
        List<Usuario> list = new ArrayList<Usuario>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario ORDER BY id where acesso = 'utente' ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAcesso(rs.getString("acesso"));
                usuario.setEstado(rs.getString("estado"));
                list.add(usuario);
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return list;
    }
    

    public static List<Usuario> getRelatorio() {
        List<Usuario> list = new ArrayList<Usuario>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setAcesso(rs.getString("acesso"));
                list.add(usuario);
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return list;
    }

    public static int getContagem() {
        int contagem = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS contagem FROM usuario");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                contagem = rs.getInt("contagem");
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return contagem;
    }

    public static int[] getRelatorioUsuarios() {

        int[] valores = {0, 0, 0};

        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS administrador FROM usuario where acesso = 'administrador'");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                valores[0] = rs.getInt("administrador");
            }

            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS artista FROM usuario where acesso = 'artista'");
            rs = ps.executeQuery();
            while (rs.next()) {
                valores[1] = rs.getInt("artista");
            }
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS utente FROM usuario where acesso = 'utente'");
            rs = ps.executeQuery();
            while (rs.next()) {
                valores[2] = rs.getInt("utente");
            }

        } catch (Exception erro) {
            System.out.println(erro);
        }
        return valores;
    }

    public static int excluirUsuario(Usuario usuario) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM usuario WHERE id=?");
            ps.setInt(1, usuario.getId());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static int bloquearUsuario(Usuario usuario) {
        int status = 0;
        String statusdousuario;

        if (usuario.getEstado().equals("ativo")) {
            statusdousuario = "inativo";
        } else {
            statusdousuario = "ativo";
        }
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE usuario SET estado=? WHERE id=?");
            ps.setString(1, statusdousuario);
            ps.setInt(2, usuario.getId());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static Usuario logar(String email, String senha) {
        Usuario usuario = new Usuario();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from usuario where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            //Verifica se a consulta retornou resultado
            if (rs.next()) {
                if (rs.getString("status").equals("ativo")) {
                    if (rs.getString("senha").equals(senha)) {
                        usuario.setId(rs.getInt("id"));
                        usuario.setNome(rs.getString("nome"));
                        usuario.setEmail(rs.getString("email"));
                        usuario.setSenha(rs.getString("senha"));
                        usuario.setAcesso(rs.getString("acesso"));
                    } else {
                        //Senha errada
                        usuario = null;
                    }
                } else {
                    //Usuário Inativo
                    usuario = null;
                }
            } else {
                // E-mail não existe
                usuario = null;
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return usuario;
    }

}
