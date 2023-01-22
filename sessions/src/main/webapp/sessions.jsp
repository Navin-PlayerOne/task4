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
boolean isNew = session.isNew() ? true: false;
String sessionname = (String)session.getAttribute("name");
String formName = request.getParameter("name");
System.out.println("Name from sesion "+sessionname );
System.out.println("Name from form "+formName);
String name=null;
if(formName!=null && formName!=""){
	name = formName;
	session.setAttribute("name",formName);
}
if(sessionname!=null && sessionname!=""){
	name = sessionname;
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
	out.println("<form action=\"sessions.jsp\" method=\"post\">"+
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