<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>

<html>
<head>
<title>add</title>
</head>
<body>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
			sql="USE project";
			con.createStatement().execute(sql);
			request.setCharacterEncoding("UTF-8");  
			String new_email=request.getParameter("email");
			String new_password=request.getParameter("password");
			String new_passwordch=request.getParameter("passwordch");
			String new_yourname=request.getParameter("yourname");
			String new_phone=request.getParameter("phone");
			String new_gender=request.getParameter("gender");
			String new_bday=request.getParameter("bday");
			String new_q1=request.getParameter("q1");
			String new_q2=request.getParameter("q2");
		  
			if (!new_password.equals(new_passwordch)){
			response.sendRedirect("login.jsp?error=passwordch");}
			else if (new_email == null || new_email.length() == 0){
			response.sendRedirect("login.jsp?error=xemail"); }
			else if (new_password == null || new_password.length() == 0){
			response.sendRedirect("login.jsp?error=xpassword"); }
			else if (new_passwordch == null || new_passwordch.length() == 0){
			response.sendRedirect("login.jsp?error=xpasswordch"); }
			else if (new_yourname == null || new_yourname.length() == 0){
			response.sendRedirect("login.jsp?error=xyourname"); }
			else if (new_phone == null || new_phone.length() == 0){
			response.sendRedirect("login.jsp?error=xphone"); }
			else if (new_gender == null || new_gender.length() == 0){
			response.sendRedirect("login.jsp?error=xgender"); }
			else if (new_bday == null || new_bday.length() == 0){
			response.sendRedirect("login.jsp?error=xbday"); }
			else if (new_q1 == null || new_q1.length() == 0){
			response.sendRedirect("login.jsp?error=xq1"); }
			else if (new_q2 == null || new_q2.length() == 0){
			response.sendRedirect("login.jsp?error=xq2"); }
			else{
				//舊版MySQL從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
				//String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
				//String new_subject=new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");
				//String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
				sql="SELECT * FROM `member` WHERE `email`='"+new_email+"'"; //算出共幾筆留言
				ResultSet rs=con.createStatement().executeQuery(sql);
				if(rs.next()){
				response.sendRedirect("login.jsp?error=repeat");
				}
				else{
//Step 4: 執行 SQL 指令	
				sql="INSERT member (`email`, `password`, `name`, `tel`, `gender`, `birth`, `q1`, `q2`) ";
				sql+="VALUES ('" + new_email + "', ";
				sql+="'"+new_password+"', ";
				sql+="'"+new_yourname+"', ";
				sql+="'"+new_phone+"', ";
				sql+="'"+new_gender+"', ";   
				sql+="'"+new_bday+"', ";
				sql+="'"+new_q1+"', ";
				sql+="'"+new_q2+"')";  
				con.createStatement().execute(sql);
//Step 6: 關閉連線
				session.setAttribute("email",request.getParameter("email"));
				con.close();
				response.sendRedirect("index.jsp");
				}
			}
		}
	}
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>