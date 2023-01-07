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
    <link rel="stylesheet" href="../CSS/cart.css">
    <link rel="shortcut icon" href="../image/icon.ico">
</head>

<body>
	<%
	Object usin=session.getAttribute("email");				
	if (usin== null){
		response.sendRedirect("login.jsp") ;
	}
	%>
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
                <div class="logopic"><a href="index.html"><img src="../image/logo.png" alt="logo"></a></div>
            </li>
            <li><a href="index.jsp#newin"><p class="head">New In</p></a></li>
            <li><a href="index.jsp#hot"><p class="head">Hot!</p></a></li>
            <li>
                <div class="dropdown">
                    <a href="product.jsp"><p class="head">All Product</p></a>
                    <div class="dropdown-content">
                        <a href="product.jsp?q=1#tab1">火/水/草/雷</a>
                        <a href="product.jsp?q=2#tab2">格鬥/一般</a>
                        <a href="product.jsp?q=3#tab3">飛行/幽靈</a>
                        <a href="product.jsp?q=4#tab4">伊布</a>
                        <a href="product.jsp?q=5#tab5">神獸</a>
                    </div>
                </div>
                        </li>
            <li><a href="aboutus.jsp"><p class="head">About Us</p></a></li>
            <!-- <li><a href="member.jsp">Member</a></li> -->
            <div class="icon-list">
                <a href="shoppingcart.jsp"><img src="../image/shoppingcart_icon.png" alt="Shopping Cart"></a>
                <%
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
    <form action="post" class="cart">
        <div class="cart-title">商品名稱</div>
        <div class="cart-title">商品數量</div>
        <div class="cart-title">小計</div>
        <div class="cart-title">刪除</div>
        <!--商品-->
        <div class="container">
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
          
		  
           sql="SELECT * FROM `buy` WHERE `email`='"+session.getAttribute("email")+"'";
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);   
  while(rs.next()){%>
            <div class="product">
                <img src="../image/<%=rs.getString(4)%>.png" alt="">
                <div class="productname">
                <h3><%=rs.getString(4)%></h3>
                <p>商品金額:<span class="productPrice"><%=rs.getString(5)%></span></p>
                </div>
            </div>
            <div class="product info">
                <div class="p-quantity">
				<form method="post" action="updatecar.jsp">
                    <input type="button" class="minusbtn" value="-">
                    <input type="number" value="1" class="quantityNum" readonly>
                    <input type="button" class="plusbtn" value="+">
                    <button type="button" class="checknum" value="確認數量">確認數量</button>
				</div>
            </div>
            <div class="product info">
                <h3>$<span class="rowTotal"><%=rs.getString(5)%></span></h3>
            </div>
            <div class="product info">
			    <form method="post" action="deletecar.jsp">
                <button class="removebtn" name="deletecar" onclick="return false;"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
            </div>
        </div>
		<%}
		con.close();
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
        <hr width="100%" color="black">

         
                 <!--付款方式-->
        <div class="bottom">
            <div class="left">
                <div class="pay">
                    付款方式：<input type="radio" value="銀行轉帳" name="pay"><p>銀行轉帳</p> <input type="radio" value="信用卡付款" name="pay"><p>信用卡付款</p><br>
                </div>
                <div class="delivery">
                    運送方式：<input type="radio" value="寄送到電子信箱" name="delivery"><p>寄送到電子信箱</p><input type="radio" value="Pokemon Go交換" name="delivery"><p>Pokemon Go交換</p>  <br>
                </div>
                <div>備註：<br><textarea name="備註" id="" cols="50" rows="10"></textarea></div> 
            </div>
            <div class="line"></div>
            <div class="right">
                <p class="checkout">總金額:$<span class="subtotal" id="demo"></span></p>
                <div class="submitbtn">
                    <input type="submit" value="確定購買" onclick="successbuy()">
                </div>
            </div>
        </div>
        </form>

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
        function successbuy(){
            window.alert("訂購成功！")
        }
    </script>
    <script>
        var increment = document.getElementsByClassName("plusbtn");
        for (var i = 0; i < increment.length; i++) {
            //為a標簽添加index屬性，用於記錄下標
            increment[i].index = i;

            //點擊+數量增加的功能函數
            increment[i].onclick = function () {
                var flag = this.index;

                //獲取當前按鈕對應的數量框
                var q = document.getElementsByClassName("quantityNum")[flag];

                var newvalue = parseInt(q.value) + 1;

                q.setAttribute('value', newvalue);

                //更新此商品對應的‘小計’
                changeSum(flag, newvalue);
            }
        }

        var decrement=document.getElementsByClassName('minusbtn');
        //点击-数量减少的功能函数
        for(var j=0;j<decrement.length;j++)
        {
            decrement[j].index=j;

            decrement[j].onclick=function()
            {
                var flag=this.index;
                //获取当前a标签对应的那个数量框
            var q=document.getElementsByClassName("quantityNum")[flag];

            if(parseInt(q.value)>1)
            {
                var newvalue=parseInt(q.value)-1;

                q.setAttribute('value',newvalue);

                changeSum(flag,newvalue);
            }
            }
        }

        //更新每個商品的‘小計’
        function changeSum(flag, num) {
            //獲取對應商品單價所在的標簽
            var temp = document.getElementsByClassName("productPrice")[flag];

            //獲取商品單價
            var unitPrice = temp.innerHTML;

            //計算新的小計價格
            var newPrice = (parseInt(unitPrice) * (num*1));
            //獲取當前“小計”的標簽
            var sum = document.getElementsByClassName("rowTotal")[flag];

            sum.innerHTML = newPrice;

            calculate();
        }

        function calculate(){
            var items=document.getElementsByClassName('product');

            var sumPrice=0;

            var p=document.getElementsByClassName('rowTotal');

            for(var m=0;m<items.length;m++)
            {
                sumPrice=sumPrice+parseInt(p[m].innerHTML);
            }

            document.getElementsByClassName("subtotal")[0].innerHTML=sumPrice;
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
    <script>   
        function removeItem(removeButton){
            var productRow = $(removeButton).parent().parent();
            productRow.fadeOut(200, function() {
                productRow.remove();
                recalculate();
        });
        }

        const removebtn = document.getElementsByClassName('removebtn');
        for(let i=0;i<removebtn.length;i++){
            removebtn[i].addEventListener('click', removeProduct);
        }
        function removeProduct(e){
            console.log(e.target.parentNode.parentNode.remove())
        }
    </script>
</body>

</html>