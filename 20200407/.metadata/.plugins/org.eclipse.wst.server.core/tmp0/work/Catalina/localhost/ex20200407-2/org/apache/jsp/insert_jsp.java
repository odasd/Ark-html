/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.5
 * Generated at: 2020-04-07 14:20:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ex01.*;

public final class insert_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
 	request.setCharacterEncoding("UTF-8"); /* 한글 깨져서 이걸로 고침  리퀘스트라는 웹의 영역이 있음, 리퀘스트의 인코딩 방식은 Utf-8이다*/ 
	String pno=request.getParameter("pno"); 
	String pname=request.getParameter("pname");
	String strPrice=request.getParameter("price"); /* 리퀘스트에 저장된 프라이스 값을 가져오라는 뜻  parameter로 가져오는거임 */
	int price = Integer.parseInt(strPrice);	/* 파라미터로 가져온 값은 무조건 스트링 값임 , 스트링값인  프라이스를 인트값으로 변경해준 것  */
						/* pares=문자를 숫자로 바꿔주는 것*/ /*request에 대한 Parameter값을 get(가져온다)한다?*/
	ProductVO vo=new ProductVO();
	vo.setPno(request.getParameter("pno"));
	vo.setPname(pname);
	vo.setPrice(price);
	
	ProductDAO dao = new ProductDAO();
	dao.insert(vo);	/*dao의 insert값을 vo에 넣어주는 것*/

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t<title>데이터 저장</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<h1>데이터가 저장 되었습니다.</h1>\r\n");
      out.write("\t<a href=\"ex01.html\">데이터 입력</a>\r\n");
      out.write("\t<h1>목록으로 이동</h1>\r\n");
      out.write("\t<a href=\"list.jsp\">목록으로 이동</a>\r\n");
      out.write("</body>\r\n");
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
