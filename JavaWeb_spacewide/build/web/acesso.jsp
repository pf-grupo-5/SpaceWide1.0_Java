    <%
       //L� dados da sess�o
       String usuario = (String) request.getSession().getAttribute("acesso");
 
       //Se n�o h� sess�o, usu�rio n�o logou, retorna para o login
        if (usuario != null) { 
             if(usuario == "admin"){
               response.sendRedirect("index.jsp");
             }
        }
    %>