<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10scope.jsp</title>
</head>
<body>
<h3>scope 테그슽</h3>
<hr>
<h4>application</h4><!-- application에 저장된 appDto 자바빈을 가져오기 -->
<jsp:useBean id="appDto" class="sample.dto.MyUser" scope="application"></jsp:useBean>
<% out.println(appDto); %>
<h4>session</h4>
<!-- sesstionScope에 저장된 sessionDto 자바빈을 가져오기 -->
<jsp:useBean id="sessionDto" class="sample.dto.MyUser" scope="session"></jsp:useBean>
<% out.println(sessionDto); %>
<h4>?????</h4>
<p>
*jsp:useBean의 기본 scope="page"입니다.
여기서 page는 pageContext입니다.
자바빈id dto는 12useBean.jsp에서만
사용할 수 있습니다.
</p>
<jsp:useBean id="dto" class="sample.dto.MyUser"></jsp:useBean>
<% out.println(dto); %>
</body>
</html>