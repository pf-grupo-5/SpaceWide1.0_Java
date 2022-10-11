<%@ page import="dao.Dao, dao.UsuarioDao"%>
<jsp:useBean id="u" class="classes.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	//Lê dados da sessão
	String acesso = (String) request.getSession().getAttribute("acesso");

	//Se não há sessão, usuário não logou, retorna pcla o login
	if (acesso == null) {
		response.sendRedirect("../index.jsp");
	}
	%>
	<%	
		int i = UsuarioDao.excluirUsuario(u);
		
		if(i > 0) {
			response.sendRedirect("../artistacontrolar.jsp?pag=1");
			
		}else{
			response.sendRedirect("../artistabloquear-erro.jsp");
		}
	%>