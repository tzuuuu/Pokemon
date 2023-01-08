<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>偷走你的寶</title>
    <link rel="stylesheet" href="../CSS/main.css">
    <link rel="stylesheet" href="../CSS/login.css">
    <link rel="stylesheet" href="../CSS/productdetail.css">
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
            <li><a href="index.jsp#newin">New In</a></li>
            <li><a href="index.jsp#hot">Hot!</a></li>
            <li>
                <div class="dropdown">
                    <a href="product.jsp">All Product</a>
                    <div class="dropdown-content">
                        <a href="product.jsp?q=1#tab1">火/水/草/雷</a>
                        <a href="product2.jsp?q=2#tab2">格鬥/一般</a>
                        <a href="product3.jsp?q=3#tab3">飛行/幽靈</a>
                        <a href="product4.jsp?q=4#tab4">伊布</a>
                        <a href="product5.jsp?q=5#tab5">神獸</a>
                    </div>
                </div>
            </li>
            <li><a href="aboutus.jsp">About Us</a></li>
            <!-- <li><a href="member.html">Member</a></li> -->
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
	<%

    Class.forName("com.mysql.jdbc.Driver");
	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
			sql="USE `project`";
			con.createStatement().execute(sql);
			String id=(String)request.getParameter("id");
			if (id==null){
				response.sendRedirect("product.jsp");
			}
			sql="SELECT * FROM `product` WHERE `pid`='"+id+"'";
			ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
			rs.last();
            sql="SELECT * FROM `product` WHERE `pid`='"+id+"'";
			rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
					
	%>
        <div class="detail">
            <div class="prdouctDetail">
                <div class="p-list">
                    <div class="p-img"><img src="../image/<%=rs.getString(3)%>.png"  /></div>
                    <div class="p-text">
                        <div class=""><span><%=rs.getString(3)%></span></div>
                        <div class=""><span><%=rs.getString(6)%></span></div>
                        <div class="">
                            <span>數量: </span>
                            <button onclick="removeNum()">-</button>
                            <span id="amount">1</span>
                            <button onclick="addNum()">+</button>
                            <span>庫存: <%=rs.getString(9)%></span>
                        </div>
                        <div class="">
                            <button class="mx-6 my-2"><a href="buy.jsp?id=<%=rs.getInt(1)%>">加入購物車</a></button>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="p-dep">
                    <div class="p-title">
                        <span>商品描述</span>
                    </div>
                    <div class="p-detail">
                        <p>屬性：<%=rs.getString(4)%></p><br>
                        <p>地區：<%=rs.getString(5)%></p><br>
                        <p>普攻：<%=rs.getString(7)%></p><br>
                        <p>大絕：<%=rs.getString(8)%></p><br>
                        <p>介紹：<br>
                            <%=rs.getString(10)%><br>
                            <%=rs.getString(11)%><br>
                            <%=rs.getString(12)%></p>
                    </div>
                </div>
				<%}
				con.close();%>
                <hr>
                <div class="p-score">
                    <div class="p-score-list">
                        <div class="p-title">
                            <span>商品評分</span>
                        </div>
						<%			
						if (usin== null){
						response.sendRedirect("login.jsp") ;
						}
						%>
                        <div class="p-comment">
                            <form action="">
                                <div class="rating">
                                    <input type="radio" name="star" id="star1"><label for="star1"></label>
                                    <input type="radio" name="star" id="star2"><label for="star2"></label>
                                    <input type="radio" name="star" id="star3"><label for="star3"></label>
                                    <input type="radio" name="star" id="star4"><label for="star4"></label>
                                    <input type="radio" name="star" id="star5"><label for="star5"></label>
                                </div>
                                <!--留言板開始-->
                                <div>
                                    <form name="form1" method="post" action="add.jsp" >
                                    Title：<input type="text" name="subject"><br>
                                    Content：<textarea rows=5 name="content"></textarea><br>
                                    <input type="submit" name="Submit" value="送出" class="submitbtn" onclick="successpreview()">
                                    <form method="post" action="productdetail.jsp" ></form>
                                    <input type="Reset" name="Reset" value="重新填寫" class="submitbtn">
                                    </form>
                                </div>
                                <!--留言板結束-->
                                <!--<input id="name" type="text" name="name" placeholder="Name" size="35%" style="height: 30px;"><br>
                                <textarea name="comment" id="" cols="50" rows="10" placeholder="Your Thought"></textarea><br>
                                <input type="submit" value="SEND">-->
                            </form>
                        </div>
                    </div>
                    <hr class="straight">
                    <div class="p-score-list">
                        <div class="p-title">
                            <span>商品評論</span>
                        </div>
                        <div class="p-review">
                            <div><li><a href="view.jsp">查看商品歷史評論</a></li></div>
                            <!--查看留言-->
                            
                            <!--<div><p>小智</p><br><p>皮卡丘絕對是夥伴No.1</p></div><hr><br>
                            <div><p>小智</p><br><p>皮卡丘絕對是夥伴No.1</p></div><hr><br>
                            <div><p>小智</p><br><p>皮卡丘絕對是夥伴No.1</p></div><hr>-->
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    
    <!--網頁尾端開始-->
    <footer class="footer">
        <p>Copyright©2022 Stealing your Pokemon<br>All rights reserved</p>
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
        function successpreview(){
            window.alert("評論成功！")
        }
    </script>
    <script>
        let n = Number(amount.innerText);
       function removeNum() {
        if(n <=1){
            return;
        }
            n--;
            amount.innerText = n
    
         }
         function addNum() {
            n++;
            amount.innerText = n
         }
    </script>    
    <script>
        const queryStr = new URL(window.location.href).searchParams.get('q')
        console.log(queryStr)
       
        function render(){
                clearContent();
                if(queryStr == 1 || queryStr==null){
                    q1.style.display = "block";
                    return;
                }
                if(queryStr == 2){
                    q2.style.display = "block";
                    return;
                }
                if(queryStr == 3){
                    q3.style.display = "block";
                    return;
                }
                if(queryStr == 4){
                    q4.style.display = "block";
                    return;
                }
                if(queryStr == 5){
                    q5.style.display = "block";
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