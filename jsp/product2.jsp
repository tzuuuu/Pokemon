<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use project";
con.createStatement().execute(sql);
String sql2="use project";
con.createStatement().execute(sql2);
String sql3="use project";
con.createStatement().execute(sql3);
String sql4="use project";
con.createStatement().execute(sql4);
String sql5="use project";
con.createStatement().execute(sql5);
String sql6="use project";
con.createStatement().execute(sql6);
String sql7="use project";
con.createStatement().execute(sql7);
String sql8="use project";
con.createStatement().execute(sql8);
String sql9="use project";
con.createStatement().execute(sql9);
String sql10="use project";
con.createStatement().execute(sql10);
%>
<%
request.setCharacterEncoding("UTF-8");
request.getSession(true);

sql="SELECT * FROM `product` WHERE `product_attritube`LIKE'火%'";
ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
sql2="SELECT * FROM `product` WHERE `product_attritube`LIKE'水%'";
ResultSet rs2=con.createStatement().executeQuery(sql2);
sql3="SELECT * FROM `product` WHERE `product_attritube`='草'";
ResultSet rs3=con.createStatement().executeQuery(sql3);
sql4="SELECT * FROM `product` WHERE `product_attritube`LIKE'雷%'";
ResultSet rs4=con.createStatement().executeQuery(sql4);
sql5="SELECT * FROM `product` WHERE `product_attritube`LIKE'格鬥%'";
ResultSet rs5=con.createStatement().executeQuery(sql5);
sql6="SELECT * FROM `product` WHERE `product_attritube`LIKE'一般%'";
ResultSet rs6=con.createStatement().executeQuery(sql6);
sql7="SELECT * FROM `product` WHERE `product_attritube`LIKE'飛行%'";
ResultSet rs7=con.createStatement().executeQuery(sql7);
sql8="SELECT * FROM `product` WHERE `product_attritube`LIKE'幽靈%'";
ResultSet rs8=con.createStatement().executeQuery(sql8);
sql9="SELECT * FROM `product` WHERE `product_attritube`LIKE'伊布%'";
ResultSet rs9=con.createStatement().executeQuery(sql9);
sql10="SELECT * FROM `product` WHERE `product_attritube`LIKE'神獸%'";
ResultSet rs10=con.createStatement().executeQuery(sql10);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>偷走你的寶</title>
    <link rel="stylesheet" href="../CSS/main.css">
    <link rel="stylesheet" href="../CSS/login.css">
    <link rel="stylesheet" href="../CSS/product.css">
    <link rel="shortcut icon" href="../image/icon.ico">
</head>

<body>
    <!--網頁標頭開始-->
    <div id="gotop"></div>
    <div id=fixed>
    <p class="ontop">HAPPY 2023 NEW YEAR SALE!</p>
    <!-- <header>
        <p class="ontop">12/25聖誕節大促銷！</p>
        <div class="mode1">
            <div class="logopic"><a href="index.html"><img src="../image/logo.png" alt="logo"></a></div>
            <ul class="list">
                <li><a href="shoppingcart.html"><img src="../image/shoppingcart_icon.png" alt="Shopping Cart"></a></li>
                <li><a href="login.html"><img src="../image/user_icon.png" alt="User"></a></li>
                <li><a href="mailto:11044114@o365st.cycu.edu.tw?Subject=我的意見"><img src="../image/email_icon.png" alt="Email"></a></li>
            </ul>
        </div>
    </header> -->
    <nav>
        <ul class="mode2">
            <li>
                <div class="logopic"><a href="index.jsp"><img src="../image/logo.png" alt="logo"></a></div>
            </li>
            <li><a href="index.jsp#newin"><p class="head">New In</p></a></li>
            <li><a href="index.jsp#hot"><p class="head">Hot!</p></a></li>
            <li>
                <div class="dropdown">
                    <a href="product.jsp"><p class="head">All Product</p></a>
                    <div class="dropdown-content">
                        <a href="product.jsp?q=1">火/水/草/雷</a>
                        <a href="product.jsp?q=2">格鬥/一般</a>
                        <a href="product.jsp?q=3">飛行/幽靈</a>
                        <a href="product.jsp?q=4">伊布</a>
                        <a href="product.jsp?q=5">神獸</a>
                    </div>
                </div>
            </li>
            <li><a href="aboutus.jsp"><p class="head">About Us</p></li>
            <!-- <li><a href="member.jsp">Member</a></li> -->
            <div class="icon-list">
                <a href="shoppingcart.jsp"><img src="../image/shoppingcart_icon.png" alt="Shopping Cart"></a>
                <%
				Object usin=session.getAttribute("email");   
				if (usin!= null){
				out.print("<a href='member.jsp'><img src='../image/user_icon.png' alt='User'></a>");
				}
				else
				out.print("<a href='login.jsp'><img src='../image/user_icon.png' alt='User'></a>");
				%>
                <a href="mailto:11044114@o365st.cycu.edu.tw?Subject=我的意見"><img src="../image/email_icon.png" alt="Email"></a>
                <%  
				if (usin!= null){
				out.print("<a href='logout.jsp'><img src='../image/logout_icon.png' alt='Logout'></a>");
				}
				%>
            </div>
        </ul>
    </nav>
    </div>
    <div class="gotop">
        <a href="#gotop" class="goTopBtn"><img src="../image/up_icon.png" alt="Back To Top"></a>
    </div>
<!--網頁標頭結束-->
 
    <div class="link-list">
        <a href="product.jsp" id="link1">火/水/草/雷</a>
        <a href="product2.jsp" id="link2">格鬥/一般</a>
        <a href="product3.jsp" id="link3">飛行/幽靈</a>
        <a href="product4.jsp" id="link4">伊布</a>
        <a href="product5.jsp" id="link5">神獸</a>
    </div>
	<section class="series">
        <div class="tab">
				<div class="item">				  
					  <div class="title-big">
                        <img src="../image/小Fighting.png" alt="Fire">
                        <p class="title">格鬥系/Fighting</p>
                    </div>
					<div class="list">
					  <%while(rs5.next()){%>
					  <div class="p-item">
					    <a href="productdetail.jsp?id=<%=rs5.getInt(1)%>"><img src="../image/<%=rs5.getString(3)%>.png" class=" rounded-lg w-[18vw]" /></a><br>
					    <p class="product_name5"><%=rs5.getString(3)%><br>
					 </div>
				    <%}%>
					</div>	
				</div>
				<div class="item">					  
					  <div class="title-big">
                        <img src="../image/小Normal.png" alt="Fire">
                        <p class="title">一般系/Normal</p>
                    </div>
					<div class="list">
					  <%while(rs6.next()){%>
					  <div class="p-item">
					    <a href="productdetail.jsp?id=<%=rs6.getInt(1)%>"><img src="../image/<%=rs6.getString(3)%>.png" class=" rounded-lg w-[18vw]" /></a><br>
					    <p class="product_name6"><%=rs6.getString(3)%><br>
					 </div>
				    <%}%>
				</div>
			</div>
		</div>
	</section>
    <!--網頁尾端開始-->
    <footer class="footer">
        <p>Copyright©2022 Stealing your Bae<br>All rights reserved</p>
        <p><%
			String strNo = (String)application.getAttribute("counter");//讀application變數
			int counter = Integer.parseInt(strNo); //轉成整數
			if (session.isNew()){
			counter++;}                                        //計數器加1
			strNo = String.valueOf(counter);
			application.setAttribute("counter", strNo);//寫application變數
			%>
			瀏覽次數<%= counter %></p>
    </footer>
    <!--網頁尾端結束-->
    <script>
        const queryStr = new URL(window.location.href).searchParams.get('q')
        console.log(queryStr)
       
        function render(){
                clearContent();
                if(queryStr == 1 || queryStr==null){
                    q1.style.display = "block";
                    link1.classList.add('action');
                    return;
                }
                if(queryStr == 2){
                    q2.style.display = "block";
                    link2.classList.add('action');
                    return;
                }
                if(queryStr == 3){
                    q3.style.display = "block";
                    link3.classList.add('action');
                    return;
                }
                if(queryStr == 4){
                    q4.style.display = "block";
                    link4.classList.add('action');
                    return;
                }
                if(queryStr == 5){
                    q5.style.display = "block";
                    link5.classList.add('action');
                    return;
                }
        }
        render();
        function clearContent(){
                q1.style.display = "none";
                q2.style.display = "none";
                q3.style.display = "none";
                q4.style.display = "none";
                q5.style.display = "none";
        }
    </script>
</body>

</html>