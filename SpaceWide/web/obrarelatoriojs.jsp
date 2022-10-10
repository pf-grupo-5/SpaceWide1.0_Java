<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="dao.Dao, dao.Obra_ArtisticaDao, classes.Obra_artistica, java.util.*"%>
<!DOCTYPE html>
<html xmlns:th="http://thymeleaf.org"
	xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href="../materialize/css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="./css/grafico.css">
<script src="./scripts/filtrar.js"></script>
<link href="./css/main.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	<%@include file="menu.jsp"%>
	<%@include file="acesso.jsp"%>

	
		<%
		int[] valores =  Obra_ArtisticaDao.getRelatorioObra();
		request.setAttribute("valores", valores);
		%>
		<div class="container">
		
		<div class="content">
		<div class="grafico">
		
			<div class="grafico">
			<canvas id="myChart"></canvas>
			<h4>Relat�rio das Obras Art�sticas</h4>
			<p>
				Publicadas:
				<%=valores[0]%></p>
			<p>
				Pendentes:
				<%=valores[1]%></p>
			<p>
				Indispon�veis:
				<%=valores[2]%></p>
		
		</div>
		</div>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js
            "></script>

		<script type="text/javascript">
			var ctx = document.getElementById("myChart");
			var valores = [
		<%=valores[0]%>
			,
		<%=valores[1]%>
			,
		<%=valores[2]%>
			];
			var tipos = [ "publicada", "pendente", "indisponivel"];
			var myChart = new Chart(ctx, {
				type : "pie",
				data : {
					labels : tipos,
					datasets : [ {
						label : "Obras Artisticas",
						data : valores,
						backgroundColor : [ "rgba(45, 102, 180, 0.2)",
								"rgba(188, 46, 31, 0.2)",
								"rgba(255, 206, 86, 0.2)",
								"rgba(75, 192, 192, 0.2)",
								"rgba(153, 102, 255, 0.2)", ]
					} ]
				}
			});
		</script>
	</div>
	
	<div class="page-footer">
	<div class="container">
		<%@include file="rodape.jsp"%>
	</div>
	</div>
	</div>
	<script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>