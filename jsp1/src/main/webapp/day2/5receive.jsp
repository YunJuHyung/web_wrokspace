<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5receive.jsp</title>
</head>
<body>
<h3>받은 파라미터를 확인합니다.</h3>
<%
	//readonly
	String name = request.getParameter("name");
	out.println(name); out.print("<br>");
	String age = request.getParameter("age");
	out.println(age); out.print("<br>");
	
	//disabled 와 hidden
	String pname = request.getParameter("pname");
	out.println(pname); out.print("<br>");
	String pcode = request.getParameter("pcode");
	out.println(pcode); out.print("<br>");
	//변수명은 파라미터 이름과 다르게 그냥하는 테스트입니다.
	String pnum = request.getParameter("pnum");
	out.print(pnum); out.print("<br>");
	
	
%>
</body>
</html>