package org.apache.jsp.principal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class principal_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/principal/../acesso.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"pt-br\">\n");
      out.write("\t\n");
      out.write("  <link rel=\"stylesheet\" href=\"../css/main.css\"/>\n");
      out.write("    <title>Space Wide</title>\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("  \n");
      out.write("      ");
      out.write("    ");

       //Lê dados da sessão
       String usuario = (String) request.getSession().getAttribute("nome");
 
       //Se não há sessão, usuário não logou, retorna para o login
        if (usuario == null) {
            response.sendRedirect("index.jsp");
        }
    
      out.write("\n");
      out.write(" \t   \n");
      out.write(" \t<div class=\"menu-bar\">\n");
      out.write(" \n");
      out.write("      <h1 class=\"logo\">Space<span>Wide</span></h1>\n");
      out.write("      <ul>\n");
      out.write("          <li><a href=\"../principal.jsp\">Início</a></li>\n");
      out.write("        <li><a href=\"#\">Obra_artística<i class=\"fas fa-caret-down\"></i></a>\n");
      out.write("\n");
      out.write("            <div class=\"dropdown-menu\">\n");
      out.write("                <ul>\n");
      out.write("                  <li><a href=\"#\">Gerenciar Obras</a></li>\n");
      out.write("                  <li><a href=\"#\">Relatório das Obras</a></li>\n");
      out.write("                </ul>\n");
      out.write("              </div>\n");
      out.write("         <li><a href=\"#\">Cliente<i class=\"fas fa-caret-down\"></i></a>\n");
      out.write("\n");
      out.write("            <div class=\"dropdown-menu\">\n");
      out.write("                <ul>\n");
      out.write("                  <li><a href=\"#\">Gerenciar Clientes</a></li>\n");
      out.write("                  <li><a href=\"#\">Relatório de Clientes</a></li>\n");
      out.write("                </ul>\n");
      out.write("              </div>\n");
      out.write("              <li><a href=\"#\">Artista<i class=\"fas fa-caret-down\"></i></a>\n");
      out.write("\n");
      out.write("            <div class=\"dropdown-menu\">\n");
      out.write("                <ul>\n");
      out.write("                  <li><a href=\"../artistacontrolar.jsp?pag=1\">Gerenciar Artistas</a></li>\n");
      out.write("                  <li><a href=\"#\">Relatório de Artistas</a></li>\n");
      out.write("                </ul>\n");
      out.write("              </div>\n");
      out.write("           <li><a href=\"#\">");
      out.print(request.getSession().getAttribute("nome"));
      out.write(" <i class=\"fas fa-caret-down\"></i></a>\n");
      out.write("\n");
      out.write("            <div class=\"dropdown-menu\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"../deslogar.jsp\">Sair</a></li>\n");
      out.write("            \n");
      out.write("                </ul>\n");
      out.write("              </div>\n");
      out.write("      </ul>\n");
      out.write("    </div>\n");
      out.write("  </body>\n");
      out.write("\n");
      out.write("</html>\n");
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
}
