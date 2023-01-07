<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
if(request.getParameter("email") !=null && !request.getParameter("email").equals("") 
	&& request.getParameter("password") != null && !request.getParameter("password").equals("")){
  
    sql="SELECT * FROM `member` WHERE `email`='" +request.getParameter("email") + 
	    "'  AND `password`='" + request.getParameter("password") + "'"  ; 
    ResultSet rs =con.createStatement().executeQuery(sql);
    
    if(rs.next()){            
        session.setAttribute("email",request.getParameter("email"));
		con.close();
        response.sendRedirect("index.jsp") ;
    }
    else{
		con.close();
        out.println("帳號與密碼不符! <a href='login.jsp'>請按此</a>重新登入") ;
	}
}
else
	response.sendRedirect("login.jsp");
%>
