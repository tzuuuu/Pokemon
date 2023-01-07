<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

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
            <!-- <li><a href="member.html"><p class="head">Member</p></a></li> -->
            <div class="icon-list">
                <a href="shoppingcart.jsp"><img src="../image/shoppingcart_icon.png" alt="Shopping Cart"></a>
                <a href="login.jsp"><img src="../image/user_icon.png" alt="User"></a>
                <a href="mailto:11044114@o365st.cycu.edu.tw?Subject=我的意見"><img src="../image/email_icon.png" alt="Email"></a>
            </div>
        </ul>
    </nav>
    </div>
    <div class="gotop">
        <a href="#gotop" class="goTopBtn"><img src="../image/up_icon.png" alt="Back To Top"></a>
    </div>
    <!--網頁標頭結束-->
	<%
	Object usin=session.getAttribute("email");   
	if (usin!= null){
		response.sendRedirect("index.jsp") ;
	}
	%>
    <div class="tabs">
        <input checked id="register" name="tabs" type="radio" style="opacity: 0;">
        <label for="register">會員註冊</label>

        <input id="login" name="tabs" type="radio" style="opacity: 0;">
        <label for="login">會員登入</label>
        <div class="panels">
            <div class="register">
                <h3 class="strre">會員註冊</h3>
                <form method="post" action="addmember1.jsp">
                電子郵件：<input type="email" name="email" value=""><br>
				<%String newss=(String)request.getParameter("error");
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("repeat")){
					out.print("該電子郵件已註冊過，請登入或輸入未註冊之電子郵件<br>");}
					if (newss.equals("xemail")){
					out.print("請輸入電子郵件<br>");}}%>
                密碼：<input type="password" name="password" value=""><br>
				<%
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("xpassword")){
					out.print("請輸入密碼<br>");}}%>
				確認密碼：<input type="password" name="passwordch" value=""><br>
				<%
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("passwordch")){
					out.print("密碼與確認密碼不符，請重新確認<br>");}
					if (newss.equals("xpasswordch")){
					out.print("請輸入確認密碼<br>");}}%>
				姓名：<input type="text" name="yourname" value=""><br>
				<%
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("xyourname")){
					out.print("請輸入姓名<br>");}}%>
                手機號碼：<input type="text" name="phone" value=""><br>
				<%
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("xphone")){
					out.print("請輸入手機號碼<br>");}}%>
                性別：<input type="radio" name="gender" id=""> 男 <input type="radio" name="gender" id=""> 女 <br>
				<%
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("xgender")){
					out.print("請輸入性別<br>");}}%>
                生日：<input type="date" name="bday" value=""><br>
				<%
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("xbday")){
					out.print("請輸入生日<br>");}}%>
                安全提示問題一：最喜歡的書籍名稱？<br>
                <input type="text" name="q1" size="40px"><br>
				<%
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("xq1")){
					out.print("請輸入問題一<br>");}}%>
                安全提示問題二：最喜歡的電影名字？<br>
                <input type="text" name="q2" size="40px"><br>
				<%
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("xq2")){
					out.print("請輸入問題二<br>");}}%> &nbsp
                <input type="submit" value="確認註冊" class="submit"><br>
                </form>
            </div>

            <div class="login">
                <h3 class="strre">會員登入</h3>
                <form method="post" action="checkac.jsp">
                電子郵件：<input type="email" name="email"><br>
                密碼：<input type="password" name="password"><br>
                <input type="submit" value="登入" class="submit">
                <input type="button" value="忘記密碼" class="submit" onclick="location.href='forget.jsp'" >

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

