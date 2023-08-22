<%@page import="java.net.InetAddress"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="org.iclass.dao.CommunityDao"%>
<%@page import="org.iclass.dto.BookUser"%>
<%@page import="org.iclass.dto.Community"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="org.iclass.dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정된 내용 db 테이블에 저장하기 -->
<%
   request.setCharacterEncoding("UTF-8");

	BookUser writer = (BookUser) session.getAttribute("user");
    
  //아래 작성자는 문제점을 발견하기 위한 추가 사항이고 나중에는 삭제합니다.  
//    String writer = request.getParameter("writer");
    String ip = request.getRemoteAddr();
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    CommunityDao dao = CommunityDao.getInstance();
    long idx = dao.insert(Community.builder()
            .writer(writer.getId())
//			.writer(writer)
            .title(title)
            .content(content)
            .ip(null)
            .build());
%>
<script type="text/javascript">
   alert('글 등록이 완료되었습니다.')
   location.href='list.jsp'
</script>
