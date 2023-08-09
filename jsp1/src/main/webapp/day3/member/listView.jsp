<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listView.jsp-화면출력 페이지</title>
</head>
<body>
${list }
<!-- request.getAttribute("list") 실행 + List<MemberDto> 타입변환 + 출력 -->
<!-- 출력을 반복해서 테이블 tr 태그에 넣기 : jstl . 애트리뷰트(자바빈)은 자바for로는 못함.-->
</body>
</html>
