<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
boolean isNew = false;
String cookieName = "";//(String)session.getAttribute("name");
Cookie[] cookies = null;
cookies = request.getCookies();
if(cookies!=null){
	for (int i = 0; i < cookies.length; i++) {
		Cookie cookie = cookies[i];
	    if(cookie.getName().equals("name")){
	    	System.out.print("yex");
	    	cookieName = cookie.getValue( );
	    }
	 }
}
String formName = request.getParameter("name");
System.out.println("Name from cookie "+cookieName );
System.out.println("Name from form "+formName);
String name=null;
if(formName!=null && formName!=""){
	name = formName;
	Cookie c = new Cookie("name",name);
	response.addCookie(c);
}
if(cookieName!=null && cookieName!=""){
	name = cookieName;
}
if(name==null){
	isNew = true;
}
else{
	isNew = false;
}

%>
<%
if(isNew){
	out.print("welcome to PlayerOnes web site <br>");
	out.println("<form action=\"cookies.jsp\" method=\"post\">"+
	        "<input type=\"text\" placeholder=\"name\" name =\"name\">"+
	        "<input type=\"password\" name=\"pass\" placeholder=\"pass\">"+
	        "<input type=\"submit\" value=\"submit\">"+
	    "</form>");
}
else{
	
	out.println("welcome back " + name);
	out.print("<br>you have been missing since "+session.getLastAccessedTime());
}
%>
</body>
</html>