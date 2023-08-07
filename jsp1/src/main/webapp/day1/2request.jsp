<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2request</title>
</head>
<body>
<ul>
	<li>요청 URL: <%= request.getRequestURL() %></li>
	<li>요청 URL: <%= request.getRequestURL() %></li>
	<li>컨텍스트(context): <%=request.getContextPath() %></li>
	<li> 클라이언트 ip : <%= request.getRemoteAddr() %></li>
	<li> 클라이언트 Host : <%= request.getRemoteHost() %></li>
	<li> 클라이언트 포트 : <%= request.getRemotePort() %></li>
	<!-- 기준이 서버이므로 remote 멀리 떨어진 것이 클라이언트. local 이 서버 -->
	<li> ip : <%= request.getLocalAddr() %></li>
	<li> Host : <%= request.getLocalName() %></li>
	<li> 서버 포트 : <%= request.getLocalPort() %></li>
</ul>
<hr>
<h4>브라우저 주소가 http://localhost:8082/jsp1/day1/2request.jsp</h4>
<h5>클라이언트 ip는 192.168.0.145</h5>
<!-- 클라이언트 ip는 192.168.0.145 -->
<ul>
	<!-- 192.168.0.216 는 사설ip. i강의장 네트워크에만 연결되는 ip -->
	<li>요청 URL: http://localhost:8082/jsp1/day1/2request.jsp</li>
	<!-- 동일한 서버와 포트 위치안에서 자원을 식별하는 부분 -->
	<li>요청 URL: /jsp1/day1/2request.jsp</li>
	<!-- 프로젝트 이름이 컨텍스트로 기본값 설정된 상태. context:맥락,문맥 -->
	<li>클라이언트 컨텍스트(context): /jsp1</li>
	<!-- 아래의 ip는 ipv6 -->
	<!-- <li> 클라이언트 ip : 0:0:0:0:0:0:0:1</li> -->
	<li>클라이언트 ip : 127.0.0.1</li>
	<li>클라이언트 Host : 127.0.0.1</li>
	<li>클라이언트 포트 : 50347</li>
</ul>

<hr>
<ul>
	<li>요청 URL: http://localhost:8082/jsp1/day1/2request.jsp</li>
	<li>요청 URL: /jsp1/day1/2request.jsp</li>
	<li>컨텍스트(context):  /jsp1</li>
	<li> 클라이언트 ip : 127.0.0.1</li>
	<li> 클라이언트 Host : 127.0.0.1</li>
	<li> 클라이언트 포트 : 30390</li>
	<!-- 기준이 서버이므로 remote 멀리 떨어진 것이 클라이언트. local 이 서버 -->
	<li> ip : <%= request.getLocalAddr() %></li>
	<li> Host : <%= request.getLocalName() %></li>
	<li> 서버 포트 : <%= request.getLocalPort() %></li>
</ul>


</body>
</html>