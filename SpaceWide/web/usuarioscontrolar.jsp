<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="classes.Usuario, dao.Dao, dao.UsuarioDao, java.util.*"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns:th="http://thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--  <link rel="stylesheet" href="/css/tabela.css"> -->
        <link href="css/grafico.css" rel="stylesheet" type="text/css"/>
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <link href="css/padrao.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>


        <title>Lista de Artistas</title>
    </head>
    <body>    
        <%@include file="acesso.jsp"%> 
        <%@include file="menu.jsp"%>

        <div class="container">        
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
                if(contagem%total==0){
                    contagem=contagem/total;
                }else{
                    contagem=contagem/total + 1;    
                }

            %>

            <h4>Relatório de Usuarios</h4>
            <div class="divider"></div>
            <div class="section">
                <table class="responsive-table">
                    <tr><th>Id</th><th>Nome</th><th>Nome artístico</th><th>Email</th><th>Senha</th><th colspan="">Estado</th><th colspan="">Data de Criação</th><th colspan="">Data de ultima modificação</th>
                        <th colspan="2">Ações:</th></tr>
                            <c:forEach items="${list}" var="user">
                        <tr>
                            <td>${user.getId()}</td>
                            <td>${user.getNome()}</td>
                            <td>${user.getEmail()}</td>            
                            <td>${user.getSenha()}</td>    
                            <td>${user.getEstado()}</td>
                            <td>${user.getData_de_criacao()}</td>
                            <td>${user.getData_da_ultima_modificacao()}
                            <td><a href="editar/Usuariobloquear.jsp?id=${user.getId()}&estado=${user.getEstado()}"> <i class="material-icons middle">lock</i></a></td>
                            <td><a href="editar/Usuarioexcluir.jsp?id=${user.getId()}" onclick="return confirm('Deseja deletar?');"><i class="material-icons middle ">delete</i></a></td>            
                            <td><a href="editar/Usuarioeditarform.jsp?id=${user.getId()}"> <i class="material-icons middle">edit</i></a></td>
                        </tr>	
                    </c:forEach>
                </table>
            </div>
          <div class="container footer">
              
              <div class="pagination">
                    <% for(i=1; i <= contagem; i++) {%>
                            <a class="active" href="usuarioscontrolar.jsp?pag=<%=i%>"><%=i%></a>
                    <% } %>   
                </div>  
                <%@include file="rodape.jsp"%>
            </div>
            <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>
