<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
           sql="USE `project`";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");
           String id=(String)request.getParameter("id");
		   
           sql="SELECT * FROM `product` WHERE `pid`='"+id+"'";
		   
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		   rs.last();
		   String pid=rs.getString(1);
           String product_name=rs.getString(3);
		   String product_price=rs.getString(6);
           
		   
		   
		      
//Step 4: 執行 SQL 指令	
      
           sql="INSERT buy (`email`,`pid`,`product_name`,`product_price`) ";
           sql+="VALUES ('" + session.getAttribute("email")+ "', ";
           sql+="'"+pid+"\', ";
		   sql+="'"+product_name+"\', ";
           sql+="'"+product_price+"') ";			   
           
           con.createStatement().execute(sql);

           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("shoppingcart.jsp");
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