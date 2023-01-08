<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Step 0: import library -->
<%@ page import = "java.sql.*" %> 
<html>
    <head>
        <title>JSP Member information update</title>
    </head>
    <body>      
	   <%  		
        try {	        
            Class.forName("com.mysql.jdbc.Driver");	  
            try {	            
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","1234");   				
		        if(con.isClosed()){
                    out.println("連線建立失敗");
				}
                else
                    {                    	
                    String sql="USE `project`";
					con.createStatement().execute(sql);
					Object usin=session.getAttribute("email");   
					if (usin == null){
					response.sendRedirect("login.jsp");
					}
					else{
						String nemail=request.getParameter("email");
						String npassword=request.getParameter("password");
						String npasswordch=request.getParameter("passwordch");
						String nyourname=request.getParameter("yourname");
						String nphone=request.getParameter("phone");
						String n_q1=request.getParameter("q1");
						String n_q2=request.getParameter("q2");		
						
						sql = "UPDATE `member` SET `passwordch`='"+npasswordch+"', `name`='"+nyourname+"', `tel`='"+nphone+"', `q1`='"+n_q1+"', `q2`='"+n_q2+"', `email`='"+nemail+"' WHERE `mid`='"+session.getAttribute("mid")+"'";
						con.createStatement().execute(sql);	
						con.close();//結束資料庫連結
						response.sendRedirect("member.jsp?good");
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
