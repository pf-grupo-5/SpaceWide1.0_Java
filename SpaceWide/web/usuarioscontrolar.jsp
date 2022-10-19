<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="classes.Usuario, dao.Dao, dao.UsuarioDao, java.util.*"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns:th="http://thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/grafico.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>


        <title>Usuarios</title>
    </head>
    <body>    
        <%@include file="acesso.jsp"%> 



        <%                String pag = request.getParameter("pag");
            int id = Integer.parseInt(pag);

            //Quantidade de Registros da Página
            int total = 5;

            if (id != 1) {
                id = id - 1;
                id = id * total + 1;
            }

            List<Usuario> list = UsuarioDao.getUsuarios(id, total);
            request.setAttribute("list", list);

            int contagem = UsuarioDao.getContagem();
            int i;
            request.setAttribute("contagem", contagem);
            if (contagem % total == 0) {
                contagem = contagem / total;
            } else {
                contagem = contagem / total + 1;
            }

        %>

        <h4 class="container-fluid">Relatório de Usuarios</h4>

        <div class="table-responsive-md">
            <table class="table align-middle">
                <thead>
                    <tr><th  scope="col">Id</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Email</th>
                        <th scope="col">Senha</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Data de Criação</th>
                        <th scope="col">Data de ultima modificação</th>
                        <th scope="col">Ações:</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <c:forEach items="${list}" var="user">
                        <tr>
                            <td scope="row">${user.getId()}</td>
                            <td scope="row">${user.getNome()}</td>
                            <td scope="row">${user.getEmail()}</td>            
                            <td scope="row">${user.getSenha()}</td>    
                            <td scope="row">${user.getEstado()}</td>
                            <td scope="row">${user.getData_de_criacao()}</td>
                            <td scope="row">${user.getData_da_ultima_modificacao()}</td>
                            <td scope="row">

                                <a href="editar/Usuariobloquear.jsp?id=${user.getId()}&estado=${user.getEstado()}"> <i class="material-icons middle">lock</i></a>
                                <a href="editar/Usuarioexcluir.jsp?id=${user.getId()}" onclick="return confirm('Deseja deletar?');"><i class="material-icons middle ">delete</i></a>
                                <a href="editar/Usuarioeditarform.jsp?id=${user.getId()}"> <i class="material-icons middle">edit</i></a>
                            </td>

                        </tr>	
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="container footer">

            <div class="pagination">
                <% for (i = 1; i <= contagem; i++) {%>
                <a class="active" href="usuarioscontrolar.jsp?pag=<%=i%>"><%=i%></a>
                <% }%>   
            </div>  
            <%@include file="rodape.jsp"%>


        </div>
    </body>
</html>
