<%@page import="java.util.Enumeration"%>
<%@page import="sample.dao.ProductDao"%>
<%@page import="sample.dto.ProductDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 처리기능 -->
<%
	String path = "d:\\iclass0419\\upload";
	int size = 10*1024*1024;		//파일 전송 용량 최대 크기
	
	//파일업로드에서는 일반적인 request 가 아닌 MultipartRequest 를 사용합니다.
	//								--> 외부 라이브러리 필요합니다.
	MultipartRequest multiRequest = new MultipartRequest(
				request,			//원래의 요청 객체
				path,				//업로드 경로
				size,				//파일 최대 크기
				"UTF-8",			//파일명 인코딩
				new DefaultFileRenamePolicy()	
				//중복된 파일이름 변경 정책. 기본정책은 번호 붙이기
			);	

	String pname = multiRequest.getParameter("pname");
	String price = multiRequest.getParameter("price");
	// 전달 받은 파일이 여러개 입니다.파일명을 , 로 구분 나열해서  db 컬럼에 저장하기
	// picture 컬럼 길이가 50이므로 최종 문자열이 50이하로 테스트 하세요.
	// Enumeration 로 반복시키기(iterator 와 유사한 동작)
	StringBuilder picture =new StringBuilder();
	// input 태그의 type="file" 요소를 모두 가져와 ens 로 참조 시킵니다.
	Enumeration ens = multiRequest.getFileNames();
	while(ens.hasMoreElements()){	//가져올 다음 요소가 있다면
		String input= (String)ens.nextElement(); //iterator 처럼 하나씩 가져오기. 리턴은 요소의 name 속성값
		picture.append(multiRequest.getFilesystemName(input))    //해당 속성값의 파일을 업로드. 문자열에 추가
				.append(",");		
		out.print(picture.toString());out.print("<br>");		//테스트. script 태그 주석처리하고 확인
	}
	
	//여기까지 실행된 결과 확인
	out.print(pname);out.print("<br>");
	out.print(price);out.print("<br>");
	out.print(picture);out.print("<br>");
	
	ProductDto dto = new ProductDto(pname,
				Integer.parseInt(price),
				null, 
				picture.toString());   //StringBuilder 를 String으로 변환
	
	ProductDao dao = ProductDao.getProductDao();
	int result = dao.insert(dto);
%>
<!-- <script type="text/javascript">
	alert('상품 등록이 완료되었습니다.');
	location.href='productListAction.jsp';
</script> -->







</body>
</html>