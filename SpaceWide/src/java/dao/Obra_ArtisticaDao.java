/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.Dao.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import classes.Obra_artistica;

public class Obra_ArtisticaDao {


	//Realiza a consulta de todas as obras artisticas
	public static Obra_artistica getObra_artisticaById(int id) {
		Obra_artistica obra = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from obra_artistica where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				obra = new Obra_artistica();
				obra.setId(rs.getInt("id_obra_artistica"));
				obra.setId_artista(rs.getInt("id_artista"));
				obra.setTitulo(rs.getString("titulo"));
				obra.setDescricao(rs.getString("descricao"));
				obra.setLocalizacao_da_imagem(rs.getString("localizacao_da_imagem"));

			}
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return obra;
	}

	//Lista todas as obras artisticas ordenando
	public static List<Obra_artistica> getObra_artistica(int inicio, int total) {
		List<Obra_artistica> list = new ArrayList<>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("SELECT * FROM obra_artistica ORDER BY id LIMIT " + (inicio - 1) + " ," + total);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Obra_artistica obra = new Obra_artistica();
				obra.setId(rs.getInt("id"));
				obra.setTitulo(rs.getString("titulo"));
				obra.setSubtitulo(rs.getString("subtitulo"));
				obra.setLocalizacao_da_imagem(rs.getString("localizacao_da_imagem"));
				obra.setEstado(rs.getString("estado"));
				obra.setData_de_criacao(rs.getTimestamp("data_de_criacao"));
				obra.setData_da_ultima_modificacao(rs.getTimestamp("data_da_ultima_modificacao"));

				list.add(obra);
			}
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return list;
	}

	//Lista as obras artisticas para imprimir os relat??rios
    public static List<Obra_artistica> relatorioObra() {
    List<Obra_artistica> list = new ArrayList<Obra_artistica>();
    try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM obra_artistica");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
        	Obra_artistica obra = new Obra_artistica();
        	obra.setId(rs.getInt("id"));
        	obra.setTitulo(rs.getString("titulo"));
        	obra.setSubtitulo(rs.getString("subtitulo"));          
        	obra.setEstado(rs.getString("estado")); 
            list.add(obra);
        }   
        } catch(Exception erro){
            System.out.println(erro);
        }
        return list;
           
    }
	
	//Realiza a contagem das obras
	public static int getContagem() {
		int contagem = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("SELECT count(*) AS contagem FROM obra_artistica");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				contagem = rs.getInt("contagem");
			}
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return contagem;
	}

	//Filtra o estado das obras 
	public static int[] getRelatorioObra() {

		int[] valores = { 0, 0, 0, 0 };

		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("SELECT count(*) as publicada FROM obra_artistica where estado = 'publicada' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				valores[0] = rs.getInt("publicada");
			}

			ps = (PreparedStatement) con
					.prepareStatement("SELECT count(*) as pendente FROM obra_artistica where estado = 'pendente'");
			rs = ps.executeQuery();
			while (rs.next()) {
				valores[1] = rs.getInt("pendente");
			}

			ps = (PreparedStatement) con.prepareStatement(
					"SELECT count(*) as indisponivel FROM obra_artistica where estado = 'indisponivel'");
			rs = ps.executeQuery();
			while (rs.next()) {
				valores[2] = rs.getInt("indisponivel");
			}

		} catch (Exception erro) {
			System.out.println(erro);
		}
		return valores;
	}

	//Bloqueia a obra alterando o seu acesso
	public static int bloquearObra(Obra_artistica obra) {
		int status = 0;
		String estadoobra;

		if (obra.getEstado().equalsIgnoreCase("publicada")) {
			estadoobra = "pendente";
		} else if (obra.getEstado().equalsIgnoreCase("pendente")) {
			estadoobra = "indisponivel";
		} else {
			estadoobra = "publicada";
		}
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("UPDATE obra_artisitica SET estado=? WHERE id=?");
			ps.setString(1, estadoobra);
			ps.setInt(2, obra.getId());
			status = ps.executeUpdate();
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return status;
	}


	//Edita os dados da obra
	public static int editarObra(Obra_artistica obra) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("UPDATE obra_artistica SET titulo, subtitulo  WHERE id=?");
			ps.setString(1, obra.getTitulo());
			ps.setString(2, obra.getSubtitulo());
			ps.setInt(3, obra.getId());
			status = ps.executeUpdate();
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return status;
	}

	
	public static int excluirObra(Obra_artistica obra) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM obra_artistica WHERE id=?");
			ps.setInt(1, obra.getId());
			status = ps.executeUpdate();
		} catch (Exception erro) {
			System.out.println(erro);
		}
		return status;
	}

}
