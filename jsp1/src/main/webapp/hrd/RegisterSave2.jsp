<%@page import="sample.dto.MemberDto"%>
<%@page import="sample.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="sample.dto.MemberDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<hr>
<jsp:getProperty property="custname" name="dto"/>
<jsp:getProperty property="phone" name="dto"/>
<jsp:getProperty property="address" name="dto"/>


<%
	
	out.print(dto);
	MemberDao dao = MemberDao.getMemberDao();
	dao.insert(dto);
	
%>
<script type="text/javascript">


	//수정한 후에 alert 나와야 합니다.
	out.print("<script>");
	out.print("alert('회원 정보 수정이 완료되었습니다.');");
	out.print("location.href='MemberList.jsp';");
	out.print("</script>");
</script>