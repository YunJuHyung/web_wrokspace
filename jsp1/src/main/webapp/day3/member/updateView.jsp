<%@page import="sample.dto.MemberDto"%>
<%@page import="sample.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">  
<title>홈쇼핑 회원 정보 수정</title>
	<link rel="stylesheet" href="../../css/Layout.css?v=3">
	<link rel="stylesheet" href="../../css/MemberUpdate.css?v=3">
</head>
<body>
 <header> <!-- header -->
 	<h2>홈쇼핑 회원관리 ver1.0</h2>
 </header> 
 <nav> <!-- nav -->
 	<!-- 반응형 웹페이지를 위해 메뉴는 목록 태그를 주로 사용합니다. 반응형 페이지 스타일은 레이아웃을 flexbox 사용해야 합니다. -->
 	<ul>
 		<li><a href="./MemberRegister.html">회원등록</a></li> 
		<li><a href="./MemberList.html">회원목록조회/수정</a></li> 
		<li><a href="./MemberSales.html">회원매출조회</a></li> 
		<li><a href="./Layout.html">홈으로.</a></li> 
 	</ul>
 </nav>
 <section>
 <h3>홈쇼핑 회원 정보 수정</h3>
 <%-- el ${} 을 쓰면 getAttribute() 역할을 합니다. el 기호 주석은 꼭 스크립트릿 주석으로. --%>
 <%-- <jsp:useBean id="member" class="sample.dto.MemberDto" scope="request"/> --%>
 <form action="UpdateSave.jsp" method="post">
 <table>
 	<tr>
 		<td><label for="lblNo">회원번호</label></td>
 		<!-- MemberList.jsp 에서 보낸 파라미터를 받아 custno 변수에 저장합니다. 그리고 value에서 출력하기. -->
 		<td><input type="number" id="lblNo" value="${param.custno }" disabled="disabled">
 			<input type="hidden" name="custno" value="${param.custno }">	
 		</td>
 	</tr>
 	<tr>
 		<td><label for="lblname">회원성명</label></td>
 		<td><input type="text" id="lblname" name="custname" value="${member.custname }"></td>
 	</tr>
 	<tr>
 		<td><label for="lblphone">회원전화</label></td>
 		<td><input type="text" id="lblphone" name="phone" value="${member.phone }"></td>
 	</tr>
 	<tr>
 		<td><label for="lbladdr">회원주소</label></td>
 		<td><input type="text" id="lbladdr" name="address" value="${member.address }"></td>
 	</tr>
 	<tr>
 		<td><label for="lblsign">가입일자</label></td>
 		<td>
 		<input type="text" id="lblsign" name="signupdate" value="${member.joindate }">
 		</td>
 	</tr>
 	<tr>
 		<td><label for="lblgrade">고객등급[A:VIP, B:일반, C:직원]</label></td>
 		<td><input  id="lblgrade" name="grade" value="${member.grade }">
 		</td>
 	</tr>
 	<tr>
 		<td><label for="lblcode">도시코드</label></td>
 		<td><input id="lblcode" name="city" value="${member.city }">
			</td>
 		</tr>
 		<tr>
 			<td colspan="2">
 				<button>수정</button>
 				<button type="button" 
 				onclick="location.href='MemberList.jsp'">조회</button>
 </table>
 </form>
 </section>
 

 <footer> <!-- footer -->
 	<h4>HRDKOREA Copyright &copy;2022 All rights reserved. Human Resources Development Service of Korea.</h4>
 </footer>

</body>
</html>
