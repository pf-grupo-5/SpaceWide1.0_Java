package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class principal_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/justifiedGallery/3.7.0/css/justifiedGallery.min.css\" integrity=\"sha256-ZKOGvp7YVwX26g2d0ooDvbSBQSEiIi4Bd9FuK+12Zk0=\" crossorigin=\"anonymous\" />\n");
      out.write("  <link rel=\"stylesheet\" href=\"./css/main.css\">\n");
      out.write("  <title>Space Wide </title>\n");
      out.write(" \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("  <header>\n");
      out.write("      \n");
      out.write("    <nav class=\"navbar\">\n");
      out.write("        \n");
      out.write("      <div class=\"left\">\n");
      out.write("        <div class=\"logo\">\n");
      out.write("          <a href=\"index.jsp\">\n");
      out.write("            <h1 class=\"logo\">Space<span>Wide</span></h1>\n");
      out.write("          </a>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"nav-search-form\">\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <ul class=\"nav\">\n");
      out.write("\n");
      out.write("    </nav>\n");
      out.write("  </header>\n");
      out.write("\n");
      out.write("  <section class=\"hero\">\n");
      out.write("    <div class=\"hero-container\">\n");
      out.write("      <div class=\"hero-content\">\n");
      out.write("        <h1>Explore o inexplorado.</h1>\n");
      out.write("        <p>\n");
      out.write("          Site em desenvolvimento. <br>\n");
      out.write("          Provérbios 10:20 Prata escolhida é a língua do justo; o coração dos perversos é de nenhum valor. <br>\n");
      out.write("          21 Os lábios do justo apascentam a muitos, mas os tolos morrem por falta de entendimento.\n");
      out.write("        </p>\n");
      out.write("  \n");
      out.write("    <div class=\"hero-overlay\"></div>\n");
      out.write("  </section>     \n");
      out.write("\n");
      out.write("  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js\" integrity=\"sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=\" crossorigin=\"anonymous\"></script>\n");
      out.write("  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/justifiedGallery/3.7.0/js/jquery.justifiedGallery.min.js\" integrity=\"sha256-bIPvSCQ7+G5GbIXDt2B+9AMpCmFtxTVLU+aWAIPzL8I=\" crossorigin=\"anonymous\"></script>\n");
      out.write("  <script>\n");
      out.write("    $('#gallery').justifiedGallery({\n");
      out.write("      rowHeight : 200,\n");
      out.write("      lastRow : 'nojustify',\n");
      out.write("      margins : 12\n");
      out.write("    });\n");
      out.write("  </script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
