<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("email") != null ){
    sql = "SELECT * FROM `member` WHERE `email`='" +session.getAttribute("email")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String email="", password="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(rs.next()){
	    email=rs.getString("email");
		password=rs.getString("password");
	}
    con.close();//結束資料庫連結
%>
您好，<%=email%>，<a href='logout.jsp'>登出</a><br />
更新您的會員資料:<br />
<form action="update.jsp" method="POST">
您的姓名：<input type="text" name="id" value="<%=email%>" />
您的密碼：<input type="password" name="pwd" value="<%=password%>" />
<input type="submit" name="b1" value="更新資料" />
</form>
<%
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<form action="check.jsp" method="POST">
帳號：<input type="email" name="email" /><br />
密碼：<input type="password" name="pwd" /><br />
<input type="submit" name="b1" value="登入" />
</form>
<%
}
%>