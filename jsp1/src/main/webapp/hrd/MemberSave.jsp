<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//메소드 방식이 post일 때는 인코딩이 꼭 필요합니다.
	//request.setCharacterEncoding("UTF=8");
	String name = request.getParameter("phone");
	out.print(name);
%>