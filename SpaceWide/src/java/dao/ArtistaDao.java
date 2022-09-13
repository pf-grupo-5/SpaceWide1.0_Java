
package dao;

import static dao.Dao.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import classes.Artista;

public class ArtistaDao {

	public static Artista getArtistaById(int id) {

		Artista artista = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM artista WHERE id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				artista = new Artista();
				artista.setId(rs.getInt("id"));
				artista.setNome(rs.getString("nome"));
				artista.setNome_artistico(rs.getString("nome_artistico"));
				artista.setEmail(rs.getString("email"));
				artista.setEstado(rs.getString("estado"));
				artista.setSenha(rs.getString("senha"));
				artista.setAcesso(rs.getString("acesso"));
			}
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return artista;
	}

	public static List<Artista> getArtista(int inicio, int total) {
		List<Artista> list = new ArrayList<Artista>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("SELECT * FROM artista ORDER BY id LIMIT " + (inicio - 1) + " ," + total);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Artista artista = new Artista();
				artista.setId(rs.getInt("id"));
				artista.setNome(rs.getString("nome"));
				artista.setNome_artistico(rs.getString("nome_artistico"));
				artista.setEmail(rs.getString("email"));
				artista.setSenha(rs.getString("senha"));
				artista.setEstado(rs.getString("estado"));
				artista.setAcesso(rs.getString("acesso"));
				artista.setData_de_criacao(rs.getTimestamp("data_de_criacao"));
				artista.setData_da_ultima_modificacao(rs.getTimestamp("data_da_ultima_modificacao"));
				list.add(artista);
			}
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return list;
	}

	public static List<Artista> getRelatorio() {
		List<Artista> list = new ArrayList<Artista>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM artista");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Artista artista = new Artista();
				artista.setId(rs.getInt("id"));
				artista.setNome(rs.getString("nome"));
				artista.setNome(rs.getString("nome_artistico"));
				artista.setEmail(rs.getString("email"));
				list.add(artista);
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
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS contagem FROM artista");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				contagem = rs.getInt("contagem");
			}
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return contagem;
	}

	public static int[] getRelatorioArtista() {

		int[] valores = { 0, 0, 0, 0 };

		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("SELECT count(*) AS ativo FROM artista where estado = 'Ativo'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				valores[0] = rs.getInt("ativo");
			}

			ps = (PreparedStatement) con
					.prepareStatement("SELECT count(*) AS inativo FROM artista where estado = 'Inativo'");
			rs = ps.executeQuery();
			while (rs.next()) {
				valores[1] = rs.getInt("inativo");
			}

			ps = (PreparedStatement) con
					.prepareStatement("SELECT count(*) AS suspenso FROM artista where estado = 'Suspenso'");
			rs = ps.executeQuery();
			while (rs.next()) {
				valores[2] = rs.getInt("suspenso");
			}

			ps = (PreparedStatement) con
					.prepareStatement("SELECT count(*) AS banido FROM artista where estado = 'Banido'");
			rs = ps.executeQuery();
			while (rs.next()) {
				valores[3] = rs.getInt("banido");
			}

		} catch (Exception erro) {
			System.out.println(erro);
		}
		return valores;
	}
	public static int excluirArtista(Artista artista) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"DELETE FROM artista, obra_artistica USING artista INNER JOIN obra_artistica WHERE obra_artistica.id_artista = artista.id AND artista.id = ?;");
			ps.setInt(1, artista.getId());
			status = ps.executeUpdate();
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return status;
	}

	public static int bloquearArtista(Artista artista) {
		int status = 0;
		String estadoartista = "";

		if (artista.getEstado().equalsIgnoreCase("ativo")) {
			estadoartista = "inativo";
		} else if (artista.getEstado().equalsIgnoreCase("inativo")) {
			estadoartista = "suspenso";
		} else if (artista.getEstado().equalsIgnoreCase("suspenso")) {
			estadoartista = "banido";
		} else {
			estadoartista = "ativo";
		}
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE artista SET estado=? WHERE id=?");
			ps.setString(1, estadoartista);
			ps.setInt(2, artista.getId());
			status = ps.executeUpdate();
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return status;
	}

	public static Artista logar(String email, String senha) {
		Artista ar = new Artista();

		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from artista where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			// Verifica se a consulta retornou resultado
			if (rs.next()) {

				if (rs.getString("estado").equals("ativo")) {
					if (rs.getString("senha").equals(senha)) {
						ar.setId(rs.getInt("id"));
						ar.setNome(rs.getString("nome"));
						ar.setEmail(rs.getString("email"));
						ar.setSenha(rs.getString("senha"));
						ar.setAcesso(rs.getString("acesso"));
					} else {
						// Senha errada
						ar = null;
					}
				} else {
					// Usu�rio Inativo
					ar = null;
				}

			} else {
				// E-mail não existe
				ar = null;
			}
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return ar;
	}

	public static int editarArtista(Artista artista) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"UPDATE artista SET nome=?, nome_artistico=?, email=?, acesso=? WHERE id=?");
			
			ps.setString(1, artista.getNome());
			ps.setString(2, artista.getNome_artistico());
			ps.setString(3, artista.getEmail());
			ps.setString(4, artista.getAcesso());
			ps.setInt(5, artista.getId());
			status = ps.executeUpdate();
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return status;
	}

}
