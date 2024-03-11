/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.86
 * Generated at: 2024-03-07 11:40:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.intro;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import intro.model.introDto;
import java.util.ArrayList;
import intro.model.introDao;

public final class introList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(3);
    _jspx_imports_classes.add("intro.model.introDao");
    _jspx_imports_classes.add("intro.model.introDto");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.7.0.js\"></script>\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");

	//db목록 가져오기
	introDao dao=new introDao();
	ArrayList<introDto>list=dao.getAllTeams();

      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<div style=\"margin: 30px 50px;\">\r\n");
      out.write("	<h1 class=\"alert alert-info\" style=\"width: 1000px;\">자기소개</h1>\r\n");
      out.write("	<table class=\"table table-bordered\" style=\"width: 900px;\">\r\n");
      out.write("		<tr class=\"table-primary\">\r\n");
      out.write("			<th width=\"60\">번호</th>\r\n");
      out.write("			<th width=\"100\">이름</th>\r\n");
      out.write("			<th width=\"60\">나이</th>\r\n");
      out.write("			<th width=\"120\">생년월일</th>\r\n");
      out.write("			<th width=\"200\">자세히보기</th>\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		");

			if(list.size()==0){
      out.write("\r\n");
      out.write("				\r\n");
      out.write("				<tr>\r\n");
      out.write("		    	  <td colspan=\"5\" align=\"center\">\r\n");
      out.write("		    	  	<h3>자기소개가 없습니다</h3>\r\n");
      out.write("		    	  </td>\r\n");
      out.write("		    	</tr>\r\n");
      out.write("			");
}else{
				for(int i=0;i<list.size();i++){
					
					introDto dto=list.get(i);
					
      out.write("\r\n");
      out.write("			    	 \r\n");
      out.write("			    	<tr>\r\n");
      out.write("			    	  <td align=\"center\">");
      out.print(i+1 );
      out.write("</td>\r\n");
      out.write("			    	  <td align=\"center\">");
      out.print(dto.getName() );
      out.write("</td>\r\n");
      out.write("			    	  <td align=\"center\">");
      out.print(dto.getAge() );
      out.write("</td>\r\n");
      out.write("			    	  <td align=\"center\">");
      out.print(dto.getBirthday() );
      out.write("</td>\r\n");
      out.write("			    	  <td align=\"center\"><button type=\"button\" class=\"btn btn-info\" onclick=\"location.href='detailPage.jsp?num=");
      out.print(dto.getNum());
      out.write("'\">자세히보기</button></td>\r\n");
      out.write("			    	</tr>\r\n");
      out.write("			   ");
}
				}	    	
		
      out.write("\r\n");
      out.write("	</table>\r\n");
      out.write("	\r\n");
      out.write("	<button type=\"button\" class=\"btn btn-success\" onclick=\"location.href='addForm.jsp'\">추가</button>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
