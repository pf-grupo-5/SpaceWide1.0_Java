    <%
       //Lê dados da sessão
       String usuario = (String) request.getSession().getAttribute("acesso");
 
       //Se não há sessão, usuário não logou, retorna para o login
        if (usuario != null) { 
             if(usuario == "admin"){
               response.sendRedirect("index.jsp");
             }
        }
    %>