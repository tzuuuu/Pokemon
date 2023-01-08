<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Back</title>
    <link rel="stylesheet" href="../CSS/back.css">
</head>
<body>
    <div class="tabs">
        <input checked id="upload" name="tabs" type="radio" style="opacity: 0;">
        <label for="upload">上傳商品</label>

        <input id="res" name="tabs" type="radio" style="opacity: 0;">
        <label for="res">回覆留言</label>
        <div class="panels">
            <div class="upload">
                <form action="addback.jsp">
                    <div>
                        <p class="b-title">上傳圖片：</p>
						<input type="hidden" name="image">
						<input accept="image/*" id="previewImage" type="file">
						<br />
						<img id="show_image" src="">
                    </div>
                    <div>
                        <p class="b-title" >商品名稱：</p>
                        <input type="text" name="name" id="">
						<%String newss=(String)request.getParameter("error");
						if (!(newss == null || newss.length() == 0)){
							if (newss.equals("repeat")){
							out.print("該商品已存在，請重新確認<br>");}
							if (newss.equals("xname")){
							out.print("請輸入商品名稱<br>");}}%>
                    </div>
					<div>
                        <p class="b-title">商品編號：</p>
                        <input type="text" name="id" id="">
						<%
						if (!(newss == null || newss.length() == 0)){
							if (newss.equals("xid")){
							out.print("請輸入商品編號<br>");}}%>
                    </div>
                    <div>
                        <p class="b-title">輸入價格：</p>
                        <input type="text" name="price" id="" placeholder="$">
						<%
						if (!(newss == null || newss.length() == 0)){
							if (newss.equals("xprice")){
							out.print("請輸入價格<br>");}}%>
                    </div>
                    <div>
                        <p class="b-title">庫存數量：</p>
                        <input type="text" name="storage" id="">
						<%
						if (!(newss == null || newss.length() == 0)){
							if (newss.equals("xnum")){
							out.print("請輸入數量<br>");}}%>
                    </div>
                    <div>
                        <p class="b-title">商品描述1：</p>
                        <input type="text" name="intro1" id="">
						<%
						if (!(newss == null || newss.length() == 0)){
							if (newss.equals("xintro1")){
							out.print("請輸入商品描述1<br>");}}%>
                    </div>
					<div>
                        <p class="b-title">商品描述2：</p>
                        <input type="text" name="intro2" id="">
                    </div>
					<div>
                        <p class="b-title">商品描述3：</p>
                        <input type="text" name="intro3" id="">
                    </div>
                    <input type="submit" value="SAVE" class="save">
                </form>
            </div>

            <div class="res">
                <table>
                   <!-- <tr>
                        <th>帳戶名稱</th>
                        <th>訂單編號</th>
                        <th>評分</th>
                        <th>評論</th>
                        <th>回覆評論</th>
                    </tr>-->
                    <tr>
                        <div><li><a href="view.jsp">查看商品歷史評論</a></li></div>

                      <!--  <td>小智</td>
                        <td>A11044114</td>
                        <td>★★★★★</td>
                        <td>可愛死了，想再買一隻</td>
                        <td><input type="text" name="response" id=""><input type="submit" value="SAVE"></td>

                    </tr>
                    <tr>
                        <td>喵咪</td>
                        <td>A11044100</td>
                        <td>★★★★★</td>
                        <td>喜歡喜歡！</td>
                        <td><input type="text" name="response" id=""><input type="submit" value="SAVE"></td>-->
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <section>
        <h1></h1>
        

    </section>
</body>
</html>