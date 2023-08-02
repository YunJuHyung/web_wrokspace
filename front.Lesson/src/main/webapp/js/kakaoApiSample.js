/**
 * 
 */

	//함수 정의(화살표 함수)
	const testKakao = () => {
	// 초창기 데이터 api가 XML 제공만 했으므로 이름에 XML 이 있습니다.
		const xhr = new XMLHttpRequest()
		
		//요청 파라미터를 쿼리스트링 즉 하나의 문자열로 만들기
		let query =document.getElementById('query').value
		let sort = document.getElementById('pageno').value
		let page = document.getElementById('size').value
		let size = document.getElementById('accuracy').checked
		if(sort){
			sort='accuracy'
		}else{
			sort='recency'
		}
		//recency(최신순)		//accuracy(정확도순)
	
	
		// 요청 url 설정 : 요청 방식 메소드 GET(조회), POST(저장) 
		xhr.open('GET',
		`https://dapi.kakao.com/v2/search/vclip?query=${query}&sort=${sort}&page=${page}&size=${size}`)
		// 요청 헤더 항목을 추가. 카카오 api에서 정함.인증과 관련된 항목
		xhr.setRequestHeader('Authorization','KakaoAK f80a80c44f07dbdb1050a27b0b7f9999')
		// 요청을 보내는 메소드
		xhr.send()
		
		let result=''
		//onload 는 응답이 오면 발생하는 이벤트. 이벤트 처리 함수 정의합니다.
		xhr.onload = function(){
			//요청 처리 결과에 대한 상태 코드 값은 status 프로퍼티 로 확인.
			if(xhr.status == 200) {
				alert('kakao 검색 응답을 받았습니다.')
				//xhr.response 는 응답으로 받은 내용 저장하는 xhr의 프로퍼티. xhr.response 은 json 문자열
				let $response = JSON.parse(xhr.response)	//문자열을 자바스크립트 객체로 변환
				result = $response.documents		//객체의 documents 프로퍼티만 변수에 저장
			}// if end
			
			console.log(result)			//콘솔에 출력
			
		} //xhr.onload function end
		
		
	} //testKakao 함수 end
	
	document.getElementById('apiBtn').addEventListener('click',testKakao)

