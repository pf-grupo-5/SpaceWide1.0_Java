package dao;

import static dao.Dao.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import classes.Cliente;

public class ClienteDao {

    public static Cliente getClienteById(int id) {
        Cliente utente = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from utente where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                utente = new Cliente();
                utente.setId(rs.getInt("id"));
                utente.setNome(rs.getString("nome"));
                utente.setEmail(rs.getString("email"));
                utente.setSenha(rs.getString("senha"));
                utente.setEstado(rs.getString("estado"));

            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return utente;
    }

    public static int editarCliente(Cliente utente) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con 
                    .prepareStatement("UPDATE utente SET nome=?, email=?, acesso=?  WHERE id=?");
            ps.setString(1, utente.getNome());
            ps.setString(2, utente.getEmail());
            ps.setString(3, utente.getAcesso());
            ps.setInt(4, utente.getId());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static List<Cliente> getClientes(int inicio, int total) {
        List<Cliente> list = new ArrayList<Cliente>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con
                    .prepareStatement("SELECT * FROM utente ORDER BY id LIMIT " + (inicio - 1) + " ," + total);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Cliente utente = new Cliente();
                utente.setId(rs.getInt("id"));
                utente.setNome(rs.getString("nome"));
                utente.setEmail(rs.getString("email"));
                utente.setSenha(rs.getString("senha"));
                utente.setEstado(rs.getString("estado"));
                utente.setAcesso(rs.getString("acesso"));
                utente.setCodigo_validador(rs.getString("codigo_validador"));
                utente.setData_de_criacao(rs.getTimestamp("data_de_criacao"));
                utente.setData_da_ultima_modificacao(rs.getTimestamp("data_da_ultima_modificacao"));
                list.add(utente);
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return list;
    }

    public static List<Cliente> getRelatorio() {
        List<Cliente> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from utente where");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente utente = new Cliente();
                utente.setId(rs.getInt("id"));
                utente.setNome(rs.getString("nome"));
                utente.setEmail(rs.getString("email"));
                list.add(utente);
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
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS contagem FROM utente");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                contagem = rs.getInt("contagem");
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return contagem;
    }

    public static int[] getRelatorioClientes() {

        int[] valores = {0, 0, 0, 0};

        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con
                    .prepareStatement("SELECT count(*) AS ativo FROM utente where estado = 'Ativo'");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                valores[0] = rs.getInt("ativo");
            }

            ps = (PreparedStatement) con
                    .prepareStatement("SELECT count(*) AS inativo FROM utente where estado = 'Inativo'");
            rs = ps.executeQuery();
            while (rs.next()) {
                valores[1] = rs.getInt("inativo");
            }

            ps = (PreparedStatement) con
                    .prepareStatement("SELECT count(*) AS suspenso FROM utente where estado = 'Suspenso'");
            rs = ps.executeQuery();
            while (rs.next()) {
                valores[2] = rs.getInt("suspenso");
            }

            ps = (PreparedStatement) con
                    .prepareStatement("SELECT count(*) AS banido FROM utente where estado = 'Banido'");
            rs = ps.executeQuery();
            while (rs.next()) {
                valores[3] = rs.getInt("banido");
            }

        } catch (Exception erro) {
            System.out.println(erro);
        }
        return valores;
    }

    public static int bloquearCliente(Cliente utente) {
        int status = 0;
        String estadoutente = "";

        if (utente.getEstado().equalsIgnoreCase("ativo")) {
            estadoutente = "inativo";
        } else if (utente.getEstado().equalsIgnoreCase("inativo")) {
            estadoutente = "suspenso";
        } else if (utente.getEstado().equalsIgnoreCase("suspenso")) {
            estadoutente = "banido";
        } else {
            estadoutente = "ativo";
        }
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE utente SET estado=? WHERE id=?");
            ps.setString(1, estadoutente);
            ps.setInt(2, utente.getId());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static int excluirCliente(Cliente utente) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM utente WHERE id=?");
            ps.setInt(1, utente.getId());
            status = ps.executeUpdate();
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return status;
    }

    public static Cliente logar(String email, String senha) {
        Cliente cl = new Cliente();

        try {
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from utente where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            // Verifica se a consulta retornou resultado
            if (rs.next()) {

                if (rs.getString("estado").equals("ativo")) {
                    if (rs.getString("senha").equals(senha)) {
                        cl.setId(rs.getInt("id"));
                        cl.setNome(rs.getString("nome"));
                        cl.setEmail(rs.getString("email"));
                        cl.setSenha(rs.getString("senha"));
                        cl.setAcesso(rs.getString("acesso"));

                    } else {
                        // Senha errada
                        cl = null;
                    }
                } else {
                    // Usuario Inativo
                    cl = null;
                }

            } else {
                // E-mail não existe
                cl = null;
            }
        } catch (Exception erro) {
            System.out.println(erro);
        }
        return cl;
    }

}
