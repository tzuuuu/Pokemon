<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>偷走你的寶</title>
    <link rel="stylesheet" href="../CSS/main.css">
    <link rel="stylesheet" href="../CSS/login.css">
    <link rel="shortcut icon" href="../image/icon.ico">
</head>

<body>
    <!--網頁標頭開始-->
    <div id="gotop"></div>
    <div id=fixed>
        <p class="ontop">HAPPY 2023 NEW YEAR SALE!</p>    <!-- <header>
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
            <li><a href="aboutus.jsp"><p class="head">About Us</p></a></li>
            <!--<li><a href="member.html">Member</a></li>-->
           <!-- <div class="search">
                <img src="../image/search_icon.png" alt="search">
                <input type="text" name="search" placeholder="Search">
           </div>-->
            <div class="icon-list">
                <a href="shoppingcart.jsp"><img src="../image/shoppingcart_icon.png" alt="Shopping Cart"></a>
                <a href="login.jsp"><img src="../image/user_icon.png" alt="User"></a>
                <a href="mailto:11044114@o365st.cycu.edu.tw?Subject=我的意見"><img src="../image/email_icon.png" alt="Email"></a>
                <a href=""><img src="../image/logout_icon.png" alt="Logout"></a>
            </div>
        </ul>
    </nav>
    </div>
    <div class="gotop">
        <a href="#gotop" class="goTopBtn"><img src="../image/up_icon.png" alt="Back To Top"></a>
    </div>
    <!--網頁標頭結束-->


    <!--忘記密碼-->
    <div class="tabs">
        <input checked id="register" name="tabs" type="radio" style="opacity: 0;">
        <label for="register">忘記密碼</label>
        <div class="panels">
            <div class="register">
                <h3 class="strre">忘記密碼</h3>
                <form method="post" action="checkfg.jsp">
                電子郵件：<input type="email" name="email" value=""><br>
                安全提示問題一：最喜歡的書籍名稱？<br>
                <input type="text" name="q1" size="40px"><br>
                安全提示問題二：最喜歡的電影名字？<br>
                <input type="text" name="q2" size="40px"><br>
                <input type="submit" value="SEND" class="submit"><br>
                </form>
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
        function forget(){
            q1=prompt("安全提示問題一：最喜歡的書籍名稱？：","哈利波特")
            q2=prompt("安全提示問題二：最喜歡的電影名字？：","想見你")
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

