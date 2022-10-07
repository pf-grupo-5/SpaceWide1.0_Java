<%@ page import="dao.Dao, dao.UsuarioDao, classes.Usuario, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Editar Artista</title>
    </head>
    <body>

        <%
            //Lê dados da sessão
            String acesso = (String) request.getSession().getAttribute("acesso");

            //Se não há sessão, usuário não logou, retorna pcla o login
            if (acesso == null) {
                response.sendRedirect("../index.jsp");
            }
        %>


        <%
            String id = request.getParameter("id");
            Usuario ar = UsuarioDao.getUsuarioById(Integer.parseInt(id));
        %>

        <div class="container">
            <div class="row">
                <h3>Editar Artista:</h3>
                <form class="col s12" action="artistaeditar.jsp" method="post">
                    <input type="hidden" name="id" value="<%=ar.getId()%>">
                    <div class="row">
                        <div class="input-field col s6">

                            <input type="text" name="nome" value="<%=ar.getNome()%>"
                                   class="validate">
                        </div>
                        <div class="input-field col s6">
                            <input type="text" name="nome_artistico" class="validate"
                                   value="<%=ar.getNome_artistico()%>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input type="email" name="email" class="validate"
                                   value="<%=ar.getEmail()%>">
                        </div>
                    </div>

                    <p>
                        <%
                            if (ar.getAcesso().equals("1")) {
                        %>
                        <label> <input name="acesso" type="radio" value="1"
                                       checked="true" /><span>admin</span>
                        </label>
                        <label> <input type="radio"
                                       name="acesso" value="0"><span>padrao</span></label>

                        <%
                        } else {
                        %>
                        <label> <input name="acesso" type="radio" value="1"
                                       checked="true" /><span>admin</span>
                        </label>
                        <label> <input type="radio"
                                       name="acesso" value="0"><span>padrao</span></label>
                    </p>
                    <%
                        }
                    %>
                    <input class="btn waves-effect waves-light" type="submit" value="Editar">

                </form>
            </div>
        </div>
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>