<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 자바빈을 생성하는 액션태그 입니다. -->
<jsp:useBean id="dto" class="sample.dto.MyUser"></jsp:useBean>
<!-- 위에서 생성된 자바빈에 프로퍼티(클래스의 변수) 
	getParameter 와 setXXXX 메소드를 실행
-->
<!-- name="dto"는 useBean태그의 id 값으로 정합니다. -->
<jsp:setProperty property="uname" name="dto" param="myname"/>
myuser 이름 : <jsp:getProperty property="uname" name="dto"/>
				<!-- getXXXX 메소드 역할 -->
나이 : <jsp:getProperty property="age" name="dto"/>
나이 : <jsp:getProperty property="address" name="dto"/>
</body>
</html>