package dao;

import classes.Usuario;
import static dao.Dao.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao {


	//Seleciona os usuarios pelo id dele
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
        } catch (SQLException erro) {
            System.out.println(erro);
        }
        return usuario;
    }
	
    //Lista os Usuários para imprimir na tela
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
                usuario.setData_de_criacao(rs.getTimestamp("data_de_criacao"));
                usuario.setData_da_ultima_modificacao(rs.getTimestamp("data_da_ultima_modificacao"));
                list.add(usuario);
            }
        } catch (SQLException erro) {
            System.out.println(erro);
        }
        return list;
    }
	
	//Lista os Usuários que são artistas para imprimir na tela
    public static List<Usuario> getUsuariosArtistas(int inicio, int total) {
        List<Usuario> list = new ArrayList<Usuario>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario AS artista where acesso = 'artista'");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setNome_artistico(rs.getString("nome_artistico"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAcesso(rs.getString("acesso"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setData_de_criacao(rs.getTimestamp("data_de_criacao"));
                usuario.setData_da_ultima_modificacao(rs.getTimestamp("data_da_ultima_modificacao"));
                list.add(usuario);
            }
        } catch (SQLException erro) {
            System.out.println(erro);
        }
        return list;
    }
		//Lista os usuarios que são clientes para imprimir na tela
		public static List<Usuario> getUsuariosClientes(int inicio, int total) {
        List<Usuario> list = new ArrayList<Usuario>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuario AS utente where acesso = 'utente' ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setAcesso(rs.getString("acesso"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setData_de_criacao(rs.getTimestamp("data_de_criacao"));
                usuario.setData_da_ultima_modificacao(rs.getTimestamp("data_da_ultima_modificacao"));
                list.add(usuario);
            }
        } catch (SQLException erro) {
            System.out.println(erro);
        }
        return list;
    }

	//Seleciona os Usuarios para o relatório
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
        } catch (SQLException erro) {
            System.out.println(erro);
        }
        return list;
    }
	//Realiza a contagem dos usuarios para realizar a paginação
    public static int getContagem() {
        int contagem = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS contagem FROM usuario");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                contagem = rs.getInt("contagem");
            }
        } catch (SQLException erro) {
            System.out.println(erro);
        }
        return contagem;
    }

	//Seleciona os usuarios pelo acesso para fazer o relatório
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

        } catch (SQLException erro) {
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
        } catch (SQLException erro) {
            System.out.println(erro);
        }
        return status;
    }
	//Bloqueia o usuario alterando o seu acesso
    public static int bloquearUsuario(Usuario usuario) {
        int status = 0;
        String statusdousuario;

        switch (usuario.getEstado()) {
            case "ativo":
                statusdousuario = "inativo";
                break;
            case "inativo":
                statusdousuario = "suspenso";
                break;
            case "suspenso":
                statusdousuario = "banido";
                break;
            default:
                statusdousuario = "ativo";
                break;
        }
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE usuario SET estado=? WHERE id=?");
            ps.setString(1, statusdousuario);
            ps.setInt(2, usuario.getId());
            status = ps.executeUpdate();
        } catch (SQLException erro) {
            System.out.println(erro);
        }
        return status;
    }
	//Realiza o login do usuario verificando o seus dados inseridos ná pagina de login
    public static Usuario logar(String email, String senha) {
        Usuario usuario = new Usuario();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from usuario where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            //Verifica se a consulta retornou resultado
            if (rs.next()) {
                    if (rs.getString("acesso").equals("administrador")) {
                        if (rs.getString("estado").equals("ativo")) {
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
            } else {
                //O acesso é inválido
                usuario = null;
            }
        } catch (SQLException erro) {
            System.out.println(erro);
        }
        return usuario;
    }

}
