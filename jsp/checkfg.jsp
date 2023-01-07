<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
if(request.getParameter("email") !=null && !request.getParameter("email").equals("") 
	&& request.getParameter("q1") != null && !request.getParameter("q1").equals("")	
    && request.getParameter("q2") != null && !request.getParameter("q2").equals("")){
  
    sql="SELECT * FROM `member` WHERE `email`='" +request.getParameter("email") + 
	    "'  AND `q1`='" + request.getParameter("q1")  + 
	    "'  AND `q2`='" + request.getParameter("q2") + "'"  ; 
    ResultSet rs =con.createStatement().executeQuery(sql);
    
    if(rs.next()){            
        session.setAttribute("email",request.getParameter("email"));
		con.close();
        response.sendRedirect("user.jsp") ;
    }
    else{
		con.close();
        out.println("安全提示問題輸入錯誤! <a href='forget.jsp'>請按此</a>重新輸入") ;
	}
}
else
	response.sendRedirect("login.jsp");
%>