<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="dao.Dao, dao.ClienteDao, classes.Cliente, java.util.*"%>
<!DOCTYPE html>
<html xmlns:th="http://thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
              rel="stylesheet">

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

        <%                    List<Cliente> list = ClienteDao.getRelatorio();
            request.setAttribute("list", list);
        %>
        <div class="container">
           
            <div class="content">
                 <div class="row">

                <div class="col s12">
                    <ul class="tabs">
                        <li style="background-color: black; color: #6a5acd;" class="tab col s3"><a href="clienterelatorio.jsp">Test 1</a></li>
                        <li style="background-color: black; color: #6a5acd;" class="tab col s3"><a class="active" href="clienterelatoriojs.jsp">Test 2</a></li>
                </div>
            </div>
                <input type="text" id="filtrarnomes" onkeyup="filtrar('filtrarnomes', 1)" placeholder="Busca de nomes">
                <input type="text" id="filtraremails" onkeyup="filtrar('filtraremails', 2)" placeholder="Busca de emails">

                <table class="striped">
                    <tr><th>Id</th><th>Nome</th><th>Email</th></tr>
                    <c:forEach items="${list}" var="usuario">
                        <tr>
                            <td>${usuario.getId()}</td>
                            <td>${usuario.getNome()}</td>
                            <td>${usuario.getEmail()}</td>               
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="footer">
            <%@include file="rodape.jsp"%>
        </div>
    </body>
</html>
