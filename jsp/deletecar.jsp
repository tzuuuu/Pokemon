<html>
<body>
<%
Object email=session.getAttribute("email"); 
String se="";  
if (email == null){
response.sendRedirect("login.jsp");
}
else{
se=usin.toString();}
request.setCharacterEncoding("UTF-8");
String deletename=request.getParameter("deletecar");
Cookie cookies[] = request.getCookies();
int count=0;
if (cookies!=null){
count=cookies.length;}
String unname="",unnum="";
if(count>0){
	for(int i=0;i<count;i++){
	if(cookies[i].getName().equals(se+"carid")){
		unname = java.net.URLDecoder.decode(cookies[i].getValue());
		Cookie old_nameCookie=new Cookie(se+"carid",unname);
		old_nameCookie.setMaxAge(0);
	}
	else if(cookies[i].getName().equals(se+"carnumber")){
		unnum =java.net.URLDecoder.decode(cookies[i].getValue());
		Cookie old_numCookie=new Cookie(se+"carnumber",unnum);
		old_numCookie.setMaxAge(0);
	}
}
String[] name=unname.split(",");
String[] num =unnum.split(",");
if (name.length==num.length){
	String newname="",newnum="";
	for(int i=0;i<name.length;i++){
		if (name[i].equals(deletename)){
			continue;
		}
		if(i==0){
		newname+=name[0];
		newnum+=num[0];
		}
		else{
		newname+=","+name[i];
		newnum+=","+num[i];
		}
	}
	newname = java.net.URLEncoder.encode(newname);
	newnum = java.net.URLEncoder.encode(newnum);
	Cookie nameCookie=new Cookie(se+"carid",newname);
	Cookie numCookie=new Cookie(se+"carnumber",newnum);
	nameCookie.setMaxAge(2678400);
	numCookie.setMaxAge(2678400);
	response.addCookie(nameCookie);
	response.addCookie(numCookie);
	response.sendRedirect("shoppingcart.jsp");
}
else{
Cookie old_nameCookie=new Cookie(se+"carid",unname);
old_nameCookie.setMaxAge(0);
Cookie old_numCookie=new Cookie(se+"carnumber",unnum);
old_numCookie.setMaxAge(0);
out.print("gg");
}
}
else{
response.sendRedirect("shoppingcart.jsp");
}
%>
</body>
<html>