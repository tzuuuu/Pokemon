<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>偷走你的寶</title>
    <link rel="stylesheet" href="../CSS/main.css">
    <link rel="stylesheet" href="../CSS/login.css">
    <link rel="stylesheet" href="../CSS/aboutus.css">
    <link rel="stylesheet" href="../CSS/member.css">
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
            <li><a href="aboutus.jsp"><p class="head">About Us</p></a></li>
            <!-- <li><a href="member.jsp">Member</a></li> -->
            <div class="icon-list">
                <a href="shoppingcart.jsp"><img src="../image/shoppingcart_icon.png" alt="Shopping Cart"></a>
                <a href="member.jsp"><img src="../image/user_icon.png" alt="User"></a>
                <a href="mailto:11044114@o365st.cycu.edu.tw?Subject=我的意見"><img src="../image/email_icon.png" alt="Email"></a>
                <% 
				Object usin=session.getAttribute("email");
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
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				String url="jdbc:mysql://localhost/?serverTimezone=UTC";
				Connection con=DriverManager.getConnection(url,"root","1234");
				String nyourname="", npassword="", npasswordch="", nphone="", nemail="", nq1="", nq2="";
				if(con.isClosed()){
					out.println("連線建立失敗");
				}
				else{
					String sql="USE `project`";
					con.createStatement().execute(sql);
					sql = "SELECT * FROM `member` WHERE `mid`='" +session.getAttribute("mid")+"';"; 
					ResultSet rs =con.createStatement().executeQuery(sql);
					
					while(rs.next()){
					nyourname=rs.getString("yourname");
					npassword=rs.getString("password");
					npasswordch=rs.getString("passwordch");
					nphone=rs.getString("phone");
					nemail=rs.getString("email");
					nq1=rs.getString("q1");
					nq2=rs.getString("q2");
					}
				con.close();//結束資料庫連結
			    }
		%>
    <div class="tabs">
        <input checked id="info" name="tabs" type="radio" style="opacity: 0;">
        <label for="info">會員基本資料</label>

        <input id="record-consume" name="tabs" type="radio" style="opacity: 0;">
        <label for="record-consume">消費紀錄</label>

        <input id="record-review" name="tabs" type="radio" style="opacity: 0;">
        <label for="record-review">評論紀錄</label>

        <div class="panels">
            <div class="info">
			<%
			String compl=request.getParameter("good");
			if (!(compl == null || compl.length() == 0)){
			out.print("會員資料修改成功!!");	  
			}
			%>
                <p class="ps">※若欲變更資料直接輸入空格中再點按更新鍵即可※</p>
                <form method="post" action="memberupdate.jsp">
                電子郵件：<input type="email" name="email" value=""><br>
                密碼：<input type="password" name="password" value=""><br>
				確認密碼：<input type="password" name="passwordch" value=""><br>
				<%String newss=(String)request.getParameter("error");
				if (!(newss == null || newss.length() == 0)){
					if (newss.equals("passwordch")){
					out.print("密碼與確認密碼不符，請重新確認<br>");}}%>
				姓名：<input type="text" name="yourname" value=""><br>
                手機號碼：<input type="text" name="phone" value=""><br>                
                安全提示問題一：最喜歡的書籍名稱？<br>
                <input type="text" name="q1" size="40px" value="" ><br>
                安全提示問題二：最喜歡的電影名字？<br>
                <input type="text" name="q2" size="40px" value=""><br>
                <input type="submit" value="更新" class="submit"><br>
                </form>
            </div>
			<%
	}
			catch (SQLException sExec) {
				out.println("SQL錯誤"+sExec.toString());
			}
		}
		catch (ClassNotFoundException err) {
			out.println("class錯誤"+err.toString());
		}
	
	%>

            <div class="record-consume">
                <table class="con-table">
                    <tr>
                        <th>訂單編號</th>
                        <th>訂單日期</th>
                        <th>訂單狀態</th>
                    </tr>
                    <tr>
                        <td>A11044114</td>
                        <td>2022/12/10</td>
                        <td>已完成</td>
                    </tr>
                    <tr>
                        <td>A11044159</td>
                        <td>2022/12/20</td>
                        <td>已完成</td>
                    </tr>
                    <tr>
                        <td>A11044121</td>
                        <td>2022/12/30</td>
                        <td>未完成</td>
                    </tr>
                </table>
            </div>

            <div class="record-review">
                <table class="review-table">

                    <div><li><a href="view.jsp">查看商品歷史評論</a></li></div>

        <!--              <tr>
                        <th>訂單編號</th>
                        <th>評分</th>
                        <th>備註</th>
                    </tr>
                    <tr>
                        <div><li><a href="view.jsp">查看商品歷史評論</a></li></div>

                      <td>A11044114</td>
                        <td>★★★★</td>
                        <td>非常讚！</td>
                    </tr>
                    <tr>
                        <td>A11044159</td>
                        <td>★★★★★</td>
                        <td>可愛死了，想再買一隻</td>
                    </tr>
                    <tr>
                        <td>A11044121</td>
                        <td>未評分</td>
                        <td>未評分</td>-->
                    </tr>
                </table>
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