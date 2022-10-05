<%@page import="classes.Usuario"%>
<%@page import="dao.Dao, dao.UsuarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="u" class="classes.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%

    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    //Envia os valores para o Dao e recebe o resultado da consulta
    Usuario user = UsuarioDao.logar(email, senha);

    //Verifica se algum usuário foi encontrado
    if (user != null) {

        request.getSession().setAttribute("acesso", user.getAcesso());
        request.getSession().setAttribute("nome", user.getNome());
        response.sendRedirect("./principal/principal.jsp");

    } else {
        response.sendRedirect("index.jsp");
        request.setAttribute("msg", "Informe o login e senha.");
    }


%>