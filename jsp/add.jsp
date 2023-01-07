<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
    dfsdfdd
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
           sql="use project";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
		   String new_title=request.getParameter("title");
		   String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
		   String ip = request.getRemoteAddr();  
		   //舊版MySQL從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼

           //String new_title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
           //String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
%>
<%!      String newline(String str)
         {
			 int index=0;
		     while((index=str.indexOf("\n"))!=-1)
			  str=str.substring(0,index) + "<br>" + str.substring(index+1);
		     return(str);
		 }
%>		 
<%	   
//Step 4: 執行 SQL 指令	
           new_content=newline(new_content);
           sql="INSERT guestbook (`Title`, `Content`, `Putdate`,`IP`) ";
           sql+="VALUES ('" + new_title + "', ";

           sql+="'"+new_content+"', ";   
           sql+="'"+new_date+"',";
           sql+="'"+ip+"')";		   

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("view.jsp?page=1");
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
