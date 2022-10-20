<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="dao.Dao, dao.UsuarioDao, classes.Usuario, java.util.*"%>
<!DOCTYPE html>
<html xmlns:th="http://thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <script src="./js/bootstrap.bundle.min.js"></script>
        <link type="text/css" rel="stylesheet" href="./css/grafico.css">
        <script src="./scripts/filtrar.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    </head>
    <body> 


        <header>
            <div class="container-lg-6">
                <nav class="navbar navbar-expand-lg bg-light">

                    <a class="navbar-brand active" href="usuarioscontrolar.jsp?pag=1">Voltar</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </nav>

            </div>
        </header>

        <%@include file="acesso.jsp"%>

        <%        int[] valores = UsuarioDao.getRelatorioUsuarios();
            request.setAttribute("valores", valores);

            List<Usuario> list = UsuarioDao.getRelatorio();
            request.setAttribute("list", list);
        %>

        <div class="container-lg-6">

            <div class="input-group">
                <span class="input-group-text">Barra de Pesquisar</span>
                <input type="text" id="filtrarnomes" onkeyup="filtrar('filtrarnomes', 1)" placeholder="Busca por nome">
                <input type="text" id="filtraremails" onkeyup="filtrar('filtraremails', 2)" placeholder="Busca por email">
                 <a class="btn btn-dark justify-content-center" href="usuariosrelatoriopdf.jsp" role="button">Gerar PDF</a>
            </div>

            <table class="table" id="myTable">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Email</th>
                        <th scope="col">Acesso</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="usuario">

                        <tr>
                            <td scope="row">${usuario.getId()}</td>
                            <td scope="row">${usuario.getNome()}</td>
                            <td scope="row">${usuario.getEmail()}</td>   
                            <td scope="row">${usuario.getAcesso()}</td>   
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


            <div class="grafico">

                <canvas id="myChart"></canvas>
                <h4>Relatório dos usuários</h4>
                <p>
                    Administradores:
                    <%=valores[0]%></p>
                <p>
                    Artistas:
                    <%=valores[1]%></p>
                <p>
                    Utentes:
                    <%=valores[2]%></p>




            </div>
            <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

            <script type="text/javascript">
                    var ctx = document.getElementById("myChart");
                    var valores = [
                <%=valores[0]%>
                        ,
                <%=valores[1]%>
                        ,
                <%=valores[2]%>
                    ];
                    var tipos = ["Administrador", "Utente", "Artista"];
                    var myChart = new Chart(ctx, {
                        type: "pie",
                        data: {
                            labels: tipos,
                            datasets: [{
                                    label: "Usuarios",
                                    data: valores,
                                    backgroundColor: ["rgba(114, 0, 251, 0.7)",
                                        "rgba(125, 0, 186, 0.5)",
                                        "rgba(138, 109, 0, 0.7)"
                                        ]
                                }]
                        }
                    });
            </script>
           
        </div>
                    
        <div class="footer">
             
            <%@include file="rodape.jsp"%>
        </div>
        <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
