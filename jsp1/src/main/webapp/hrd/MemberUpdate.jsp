<%@page import="sample.dto.MemberDto"%>
<%@page import="sample.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Layout(외부평가)</title>
	<link rel="stylesheet" href="../../css/Layout.css?v=3">
</head>
<body>
<!-- 정보 수정 화면은 현재값을 먼저 보여주고 수정할 수 있게 합니다. custno 즉 PK값으로
	 db에서 select 한 결과를 화면에 표시하는 코드가 필요합니다. -->
<!-- MemberList.jsp 에서 보낸 파라미터를 받아 custno 변수에 저장합니다. 그리고 value에서 출력하기 -->
<%
	String custno = request.getParameter("custno");
	MemberDao dao = MemberDao.getMemberDao();
	MemberDto dto = null;
	if(custno != null)	/* 수정할 데이터를 가져오기.(참고:custno 가 테이블 PK값) */
			dto = dao.selectOne(Integer.parseInt(custno));
%>
	<div class="header">
		<h2>홈쇼핑 회원관리 ver1.0</h2>
	</div>
	<div class="nav">
	<!-- 반응형 웹페이지를 위해 메뉴는 목록 태그를 주로 사용합니다. 반응형 페이지 스타일은 레이아웃을 flexbox 사용해야 합니다.-->
		<ul>
		
			<li><a href="">회원등록</a></li>
			<li><a href="">회원목록조회/수정</a></li>
			<li><a href="">회원매출조회</a></li>
			<li><a href="">홈으로.</a></li>
		</ul>	
	</div>
		<h3>홈쇼핑 회원 등록</h3>
		<form action="" method="post">
		<table id="divtable">
		<tr>
			<td><label for="lblNo">회원번호</label></td>
			<!-- MemberList.jsp 에서 보낸 파라미터를 받아 custno 변수에 저장합니다. 그리고 value에서 출력하기 -->
			<td><input type="number" id="lblNo" name="customNo" value="<%=custno %>" disabled="disabled">
				<!-- disabled로 설정된 것은 파라미터 전달이 안됩니다.readyonly로 바꾸세요. -->
			</td>
		</tr>
		<tr>
			<td><label for="lblName">회원성명</label></td>
			<td><input type="text" id="lblName" name="name" value="<%= dto.getCustname() %>"></td>
		</tr>
		<tr>
			<td><label for="lblCall">회원전화</label></td>
			<td><input type="number" id="lblCall" name="call" value="<%=dto.getPhone() %>"></td>
		</tr>
		<tr>
			<td><label for="lblAdress">회원주소</label></td>
			<td><input type="text" id="lblAdress" name="adress" value="<%=dto.getAddress() %>"></td>
		</tr>
		<tr>
			<td><label for="lblDate">가입일자</label></td>
			<td><input type="number" id="lblDate" name="date" value="<%=dto.getJoindate() %>"></td>
		</tr>
		<tr>
			<td><label for="lblGrade">고객등급</label></td>
			<td><input type="text" id="lblGrade" name="grade" value="<%=dto.getGrade() %>"></td>
		</tr>
		<tr>
			<td><label for="lblRegion">도시코드</label></td>
			<td><input type="number" id="lblRegion" name="region" value="<%=dto.getCity() %>"></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<button>수정</button>
				<!-- form태그 안에 있을때는 type=sibmit 생략됨 -->
				<button type="reset">조회</button>
			</td>
		</tr>
		
		</table>
	</form>
	<footer>HRDKOREA Copyright &copy;2022 ALL rights reserved. Human Resources Development Service
			of Korea.</footer>
</body>
</html>