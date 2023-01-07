<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head><title>取得Cookie資料</title></head>
    <body>
<%
request.setCharacterEncoding("UTF-8");//從表單傳中文
        String pnum =(String)request.getParameter("amount");
        String car = request.getParameter("car");
		String pn="";
		String link="";
		Object usin=session.getAttribute("email");
		String se="";
		if (car!= null ){
			if(usin == null){
				response.sendRedirect("login.jsp");
			}
			else{
			pn=car;
			link=("productdetail.jsp");
			}
		}
		else{
			response.sendRedirect("product.jsp");
		}
		String carid="";
		if(usin != null){
		se=usin.toString();}
		Cookie cookies[] = request.getCookies();
		if (!(pnum == null || pnum.length() == 0) && !(pnum == null || pnum.length() == 0)){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				String url="jdbc:mysql://localhost/?serverTimezone=UTC";
				String sql="";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed()){
				out.println("連線建立失敗");}
				else {
					sql="use `project`";
			con.createStatement().execute(sql);
				sql="SELECT `pid` FROM `products` WHERE `product_name`='"+pn+"'";
				ResultSet rs=con.createStatement().executeQuery(sql);
				while(rs.next()){
					carid=Integer.toString(rs.getInt(1));
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
if (carid.equals(""))
			{
				out.print("找不到商品");
			}
else{
	int count=0;
	if (cookies!=null){
	count = cookies.length;
	}
		if(count<1){
			Cookie nameCookie = new Cookie(se+"carid", java.net.URLEncoder.encode(carid));
			Cookie numCookie = new Cookie(se+"carnumber",java.net.URLEncoder.encode(pnum));
			nameCookie.setMaxAge(2678400);
			numCookie.setMaxAge(2678400);
			response.addCookie(nameCookie);
			response.addCookie(numCookie);
			response.sendRedirect(link);
		}
		else{
			String name = "",num = "";
        for(int i=0;i<count;i++){
            if(cookies[i].getName().equals(se+"carid")){
               name =java.net.URLDecoder.decode(cookies[i].getValue());
			   Cookie old_nameCookie=new Cookie(se+"carid",name);
			   old_nameCookie.setMaxAge(0);
			}
            else if(cookies[i].getName().equals(se+"carnumber")){
                num =java.net.URLDecoder.decode(cookies[i].getValue());
				Cookie old_numCookie=new Cookie(se+"carnumber",num);
			    old_numCookie.setMaxAge(0);
			}
		}
		//易爆物
			String[] checkname=name.split(",");
			String[] checknum =num.split(",");
			name="";num="";
			int nn=0;
			for(int i=0;i<checkname.length;i++){
				
				if (checkname[i].equals(carid)){
					checknum[i]=Integer.toString(Integer.parseInt(pnum)+Integer.parseInt(checknum[i]));
					nn++;
				}
				if (i==0){
					name=checkname[0];
					num=(String)checknum[0];
				}
				else{
					name+=","+checkname[i];
					num+=","+(String)checknum[i];
				}
				}
			if (nn<1){
				name+=","+carid;
				num+=","+pnum;
			}
			name = java.net.URLEncoder.encode(name);
			num = java.net.URLEncoder.encode(num);
			Cookie idCookie=new Cookie(se+"carid",name);
			Cookie numCookie=new Cookie(se+"carnumber",num);
			idCookie.setMaxAge(2678400);
			numCookie.setMaxAge(2678400);
			response.addCookie(idCookie);
			response.addCookie(numCookie);
			response.sendRedirect(link);
		}
        }
		}
//讀取已存在Client端的Cookie
        
        
    %>
    </body>
</html>