<%@ page import="dao.Dao, dao.ClienteDao"%>
<jsp:useBean id="u" class="classes.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%
	//L� dados da sess�o
	String acesso = (String) request.getSession().getAttribute("acesso");

	//Se n�o h� sess�o, usu�rio n�o logou, retorna pcla o login
	if (acesso == null) {
		response.sendRedirect("../index.jsp");
	}
	%>
<%
    int i = ClienteDao.bloquearCliente(u);
    
    if(i>0){
        response.sendRedirect("../clientescontrolar.jsp?pag=1");
    }else{
        response.sendRedirect("clientesbloquear-erro.jsp");        
    }
%>