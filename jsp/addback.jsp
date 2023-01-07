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
			String product_name=request.getParameter("name");
			String pid=request.getParameter("id");
			String product_price=request.getParameter("price");
			String num=request.getParameter("storage");
			String intro1=request.getParameter("intro1");
			String intro2=request.getParameter("intro2");
			String intro3=request.getParameter("intro3");
			
			if (product_name == null || product_name.length() == 0){
			response.sendRedirect("back.jsp?error=xname"); }
			else if (pid == null || pid() == 0){
			response.sendRedirect("back.jsp?error=xpid"); }
			else if (product_price == null || product_price.length() == 0){
			response.sendRedirect("back.jsp?error=xprice"); }
			else if (num == null || num.length() == 0){
			response.sendRedirect("back.jsp?error=xnum"); }
			else if (intro1 == null || intro1.length() == 0){
			response.sendRedirect("back.jsp?error=xintro1"); }			
			else{
				sql="SELECT * FROM `product` WHERE `product_name`='"+product_name+"'"; //算出共幾筆留言
				ResultSet rs=con.createStatement().executeQuery(sql);
				if(rs.next()){
				response.sendRedirect("back.jsp?error=repeat");
				}
				else{	
				sql="INSERT product (`product_name`,`product_price`, `num`, `intro1`,  `intro2`, `intro3`) ";
				sql+="VALUES ('" + product_name + "', ";
				sql+="'"+product_price+"', ";
				sql+="'"+num+"', ";
				sql+="'"+intro1+"', ";
				sql+="'"+intro2+"', ";   
				sql+="'"+intro3+"')";  
				con.createStatement().execute(sql);
				con.close();
				response.sendRedirect("back.jsp");
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