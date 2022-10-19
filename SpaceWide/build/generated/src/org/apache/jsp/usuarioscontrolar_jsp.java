package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import classes.Usuario;
import dao.Dao;
import dao.UsuarioDao;
import java.util.*;

public final class usuarioscontrolar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/acesso.jsp");
    _jspx_dependants.add("/menu.jsp");
    _jspx_dependants.add("/rodape.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html xmlns:th=\"http://thymeleaf.org\"\r\n");
      out.write("      xmlns:layout=\"http://www.ultraq.net.nz/thymeleaf/layout\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link href=\"css/grafico.css\" rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("        <meta charset=\"UTF-8\"/>\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\" />\r\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\r\n");
      out.write("        <script src=\"js/bootstrap.bundle.min.js\"\r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("        <title>Lista de Artistas</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>    \r\n");
      out.write("        ");
      out.write("    ");

       //Lê dados da sessão
      	String  acesso = (String) request.getSession().getAttribute("acesso");
 
       //Se não há sessão, usuário não logou, retorna para o login
        if (acesso == null) {
            response.sendRedirect("index.jsp");
        }
    
      out.write(" \r\n");
      out.write("        ");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write(" <div class=\"menu-bar\">\r\n");
      out.write(" \r\n");
      out.write("    <h1 class=\"logo\" ><a href=\"principal/principal.jsp\">Space<span>Wide</span></a></h1>\r\n");
      out.write("      <ul>\r\n");
      out.write("          <h1 class=\"logo\" ><a href=\"usuarioscontrolar.jsp?pag=1\">usuarios</a></h1>\r\n");
      out.write("        <li><a href=\"#\">Obra artísticas<i class=\"fas fa-caret-down\"></i></a>\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"dropdown-menu\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                  <li><a href=\"obrartisticacontrolar.jsp?pag=1\">Gerenciar Obras</a></li>\r\n");
      out.write("                  <li><a href=\"obrarelatorio.jsp\">Relatório Obra</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("              </div>\r\n");
      out.write("         <li><a href=\"#\">Cliente<i class=\"fas fa-caret-down\"></i></a>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"dropdown-menu\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                  <li><a href=\"clientescontrolar.jsp?pag=1\">Gerenciar Clientes</a></li>\r\n");
      out.write("                  <li><a href=\"clienterelatorio.jsp\">Relatório de Clientes</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("              </div>\r\n");
      out.write("              <li><a href=\"#\">Artista<i class=\"fas fa-caret-down\"></i></a>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"dropdown-menu\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                  <li><a href=\"artistacontrolar.jsp\">Gerenciar Artistas</a></li>\r\n");
      out.write("                  <li><a href=\"artistarelatorio.jsp\">Relatório de Artistas</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("              </div>\r\n");
      out.write("                    <li><a href=\"usuarioscontrolar.jsp?pag=1\">Usuario<i class=\"fas fa-caret-down\"></i></a>\r\n");
      out.write("\r\n");
      out.write("           <li><a href=\"#\">");
      out.print(request.getSession().getAttribute("nome"));
      out.write(" <i class=\"fas fa-caret-down\"></i></a>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"dropdown-menu\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"deslogar.jsp\">Sair</a></li>\r\n");
      out.write("            \r\n");
      out.write("                </ul>\r\n");
      out.write("              </div>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <div class=\"container\">        \r\n");
      out.write("            ");
                String pag = request.getParameter("pag");
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

            
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <h4>Relatório de Usuarios</h4>\r\n");
      out.write("            <div class=\"divider\"></div>\r\n");
      out.write("            <div class=\"section\">\r\n");
      out.write("                <table class=\"table\">\r\n");
      out.write("                    <tr><th  scope=\"col\">Id</th><th  scope=\"col\">Nome</th><th  scope=\"col\">Nome artístico</th><th scope=\"col\">Email</th><th scope=\"col\">Senha</th><th  scope=\"col\">Estado</th><th   scope=\"col\">Data de Criação</th><th scope=\"col\">Data de ultima modificação</th>\r\n");
      out.write("                        <th  scope=\"col\">Ações:</th></tr>\r\n");
      out.write("                            ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("          <div class=\"container footer\">\r\n");
      out.write("              \r\n");
      out.write("              <div class=\"pagination\">\r\n");
      out.write("                    ");
 for(i=1; i <= contagem; i++) {
      out.write("\r\n");
      out.write("                            <a class=\"active\" href=\"usuarioscontrolar.jsp?pag=");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</a>\r\n");
      out.write("                    ");
 } 
      out.write("   \r\n");
      out.write("                </div>  \r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                   \r\n");
      out.write("            </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVar("user");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                        <tr>\r\n");
          out.write("                            <td >");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getNome()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getEmail()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>            \r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getSenha()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>    \r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getEstado()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getData_de_criacao()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</td>\r\n");
          out.write("                            <td>");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getData_da_ultima_modificacao()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\r\n");
          out.write("                            <td><a href=\"editar/Usuariobloquear.jsp?id=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("&estado=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getEstado()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\"> <i class=\"material-icons middle\">lock</i></a></td>\r\n");
          out.write("                            <td><a href=\"editar/Usuarioexcluir.jsp?id=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" onclick=\"return confirm('Deseja deletar?');\"><i class=\"material-icons middle \">delete</i></a></td>            \r\n");
          out.write("                            <td><a href=\"editar/Usuarioeditarform.jsp?id=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user.getId()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\"> <i class=\"material-icons middle\">edit</i></a></td>\r\n");
          out.write("                        </tr>\t\r\n");
          out.write("                    ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }
}
