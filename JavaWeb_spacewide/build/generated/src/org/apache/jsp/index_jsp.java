package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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

      out.write("<<<<<<< HEAD\n");
      out.write("=======\n");
      out.write("\n");
      out.write("\n");
      out.write(">>>>>>> branch 'master' of https://github.com/davicarvalho23/ProjetoJavaWeb.git\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"pt-br\">\n");
      out.write("<head>\n");
      out.write("   \n");
      out.write("    <title>Login</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"./css/login.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"main\">\n");
      out.write("        <div class=\"navbar\">\n");
      out.write("            <div class=\"icon\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"menu\">\n");
      out.write("            </div>\n");
      out.write("        </div> \n");
      out.write("        <div class=\"content\">\n");
      out.write("            <h1><br><span>Artes digitais & Fotografias</span><br>Com alta qualidade</h1>\n");
      out.write("            <p class=\"par\">O SpaceWide é uma plataforma de compartilhamento e venda de Imagens digitais<br>\n");
      out.write("            com alta qualidade , já contamos na nossa comunidade<br>\n");
      out.write("            uma grande quantidade de artistas com diversos tipos de artes digitais </p>\n");
      out.write("\n");
      out.write("                <button class=\"cn\"><a href=\"/html/cadastrar.html\">Junte-se</a></button>\n");
      out.write("\n");
      out.write("             <div class=\"form\">\n");
      out.write("<<<<<<< HEAD\n");
      out.write("              \n");
      out.write("=======\n");
      out.write("                  \n");
      out.write(">>>>>>> branch 'master' of https://github.com/davicarvalho23/ProjetoJavaWeb.git\n");
      out.write("                     <form action=\"login.jsp\" method=\"post\">  \n");
      out.write("                         <h2>Space<span>Wide</span></h2>\n");
      out.write("                    <input type=\"email\" name=\"email\" placeholder=\"Email...\">\n");
      out.write("                    <input type=\"password\" name=\"senha\" placeholder=\"Senha...\">\n");
      out.write("                    <input type=\"submit\" value=\"Entrar\" >\n");
      out.write("                    </form>\n");
      out.write("                 \n");
      out.write("              \n");
      out.write("                    <p class=\"link\">Não possui uma conta ?\n");
      out.write("                    Crie uma</a><a href=\"#\"> aqui</a></p>  \n");
      out.write("             </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
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
