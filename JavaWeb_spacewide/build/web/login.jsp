<%@page import="classes.Artista, classes.Cliente"%>
<%@page import="dao.Dao, dao.ClienteDao, dao.ArtistaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="u" class="classes.Artista"></jsp:useBean>
 <jsp:useBean id="j" class="classes.Cliente"></jsp:useBean> 
<jsp:setProperty property="*" name="u" />
    
<%
   
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
  
    //Envia os valores para o Dao e recebe o resultado da consulta
    
 	
 		
 	
    Cliente cl = ClienteDao.
 
  
    //Verifica se algum usuário foi encontrado
    if(adm != null){
        //Cria sessão e redireciona para a tela principal
  	request.getSession().setAttribute("nome",adm.getNome());
      	 response.sendRedirect("./principal/principal.jsp");
        
    }else{
    	response.sendRedirect("index.jsp");  
    	request.setAttribute("msg","Informe o login e senha.");
    	}
 	
    
    
%>