/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.5
 * Generated at: 2020-04-19 11:04:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ex01.*;

public final class read_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

   String strBno=request.getParameter("bno");
   int bno=Integer.parseInt(strBno);
   
   BoardDAO dao=new BoardDAO();
   BoardVO vo=dao.read(bno);

      out.write("    \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("   <meta charset=\"UTF-8\">\r\n");
      out.write("   <title>연습</title>\r\n");
      out.write("   <link rel=\"stylesheet\" href=\"home.css\"/>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("   <div id=\"page\">\r\n");
      out.write("      <div id=\"content\">\r\n");
      out.write("         <h3>글읽기</h3>\r\n");
      out.write("         <hr>\r\n");
      out.write("         <div id=\"menu\">\r\n");
      out.write("            <a href=\"list.jsp\">목록</a>\r\n");
      out.write("         </div>\r\n");
      out.write("         <form class=\"frm\" action=\"sqlUpdate.jsp\">\r\n");
      out.write("            <table class=\"tblInsert\">\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <td>Title</td>\r\n");
      out.write("                  <td><input type=\"text\" size=82 name=\"title\" value=\"");
      out.print(vo.getTitle());
      out.write("\"></td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <td colspan=2>\r\n");
      out.write("                     <textarea rows=\"10\" cols=\"90\" name=\"content\">");
      out.print(vo.getContent());
      out.write("</textarea>\r\n");
      out.write("                  </td>\r\n");
      out.write("               </tr>\r\n");
      out.write("               <tr>\r\n");
      out.write("                  <td colspan=2 style=\"text-align:center;\">\r\n");
      out.write("                     <input class=\"button\" type=\"reset\" value=\"취소\">\r\n");
      out.write("                     <input class=\"button\" type=\"submit\" value=\"수정\">\r\n");
      out.write("                     <input class=\"delete\" type=\"button\" value=\"삭제\">\r\n");
      out.write("                  </td>\r\n");
      out.write("               </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("         </form>\r\n");
      out.write("      </div>\r\n");
      out.write("   </div>\r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("\t$(\".tblInsert\").on(\"click\", \".row .delete\",function(){\r\n");
      out.write("\t\tvar row=$(this).parent().parent();\r\n");
      out.write("\t\t$(row).remove();\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
