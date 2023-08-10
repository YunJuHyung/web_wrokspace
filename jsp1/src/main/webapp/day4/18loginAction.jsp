<%@page import="sample.dto.JCustomerDto"%>
<%@page import="sample.dao.JCustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>18loginAction.jsp</title>
</head>
<body>
<%
	//id와 패스워드 전달 받아서 dao loing 메소드 실행
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	out.print(userid+" ");out.print(password);
	JCustomerDao dao = new JCustomerDao();
	JCustomerDto customer = dao.login(userid,password);
	if(customer != null){
		session.setAttribute("user", customer);
	}
	
	
	
	out.print("<script>");
	if(customer != null){
		out.print("alert('로그인 성공했습니다.');");
		out.print("location.href='index.jsp';");
	}else{
		out.print("alert('로그인 실패했습니다.');");
		out.print("location.href='17loginView.jsp';");
	}
	/* alert 안에서 줄바꿈은 html 문서 안에서 실행되어야 하므로 \\n 으로 하세요.
		\n으로 하면 자바에서 처리할 수가 없어서 오류가 발생합니다.
	*/
	out.print("</script>");
%>

</body>
</html>