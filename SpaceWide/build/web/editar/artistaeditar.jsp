<%@ page import="dao.Dao, dao.ArtistaDao"%>
<jsp:useBean id="u" class="classes.Artista"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>


<%
    //L� dados da sess�o
    String acesso = (String) request.getSession().getAttribute("acesso");

    //Se n�o h� sess�o, usu�rio n�o logou, retorna pcla o login
    if (acesso == null) {
        response.sendRedirect("../index.jsp");
    }
%>

<%
    int i = ArtistaDao.editarArtista(u);

    if (i > 0) {
        response.sendRedirect("../artistacontrolar.jsp?pag=1");

    } else {
        response.sendRedirect("../artistaeditar-erro.jsp");
    }
%>