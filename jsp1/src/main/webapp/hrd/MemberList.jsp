<%@page import="sample.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="sample.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
<link rel="stylesheet" href="./Layout.css?v=3">
<link rel="stylesheet" href="./MemberList.css?v=3">
</head>
<body>
<%
	MemberDao dao = MemberDao.getMemberDao();
	List<MemberDto> list = dao.selectAll();
	//list를 태그에 출력하는 반복문은 향상for문 사용합시다.
%>
	<header>
		<!-- header -->
		<h2>홈쇼핑 회원관리 ver1.0</h2>
	</header>
	<nav>
		<!-- nav -->
		<!-- 반응형 웹페이지를 위해 메뉴는 목록 태그를 주로 사용합니다. 반응형 페이지 스타일은 레이아웃을 flexbox 사용해야 합니다. -->
		<ul>
			<li><a href="./MemberRegister.html">회원등록</a></li>
			<li><a href="./MemberList.html">회원목록조회/수정</a></li>
			<li><a href="./MemberSales.html">회원매출조회</a></li>
			<li><a href="./Layout.html">홈으로.</a></li>
		</ul>
	</nav>
	<section>
		<h2>회원목록조회/수정</h2>
		<!-- action은 input 데이터를 전달받고 처리할 url 입니다. 
			 MemberSave.jsp를 만드세요. 그리고 전달받은 파라미터로 update 실행하도록 하세요.
			 	ㄴ 이 파일에는 자바코드 만 작성하고 태그는 필요 없습니다.-->
		<form action="MemberSave.jsp" method="post"></form>
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
<%
		//list.get(i).getCustno() 처럼 인덱스 쓰지말고 향상 for문
		for(MemberDto dto : list){
%>			
			<tr>
				<td><a href="MemberUpdate.jsp?custno=<%= dto.getCustno()%>">
				<%=dto.getCustno() %></a>
				</td>
				<td><%=dto.getCustname() %></td>
				<td><%=dto.getPhone() %></td>
				<td><%=dto.getAddress() %></td>
				<td><%=dto.getJoindate() %></td>
				<!-- 스크립트릿, 표현식 자바코드 주석기호는 아래를 참고하세요 -->
				<%-- <td><%=dto.getGrade() %></td> --%>
				<!-- 스크립트릿 자바코드 위치는 body안에 어디에나 가능합니다. -->
				<td>
				<!-- out: jsp 객체.html 문서에 출력기능을 갖고 텍스트와 태그를 출력합니다.
							따로 선언하지 않고 사용하는 내장(embeded) 객체입니다.
				 -->
					<%
						if(dto.getGrade().equals("VIP"))
							out.println("<span style='color:red;'>VIP</span>");
						else
							out.println(dto.getGrade());
					%>
				</td>
				<td><%=dto.getCity()%></td>
			</tr>
<%
		}
%>
		</table>
	</section>
	<footer>
		<!-- footer -->
		<h4>HRDKOREA Copyright &copy;2022 All rights reserved. Human
			Resources Development Service of Korea.</h4>
	</footer>
</body>
</html>