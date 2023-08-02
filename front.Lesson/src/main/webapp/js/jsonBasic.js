/**
 * 
 */
 
 const schedules = [{time:'09:00',todo:'수업'},
					{time:'11:00',todo:'과제'},
					{time:'12:30',todo:'점심식사'},
					{time:'14:00',todo:'주간회의'},
					{time:'16:45',todo:'자유조사'}]
	
	const str = JSON.stringify(schedules)
	document.write(str)
	document.write('<br>')
	console.log(typeof str)
	console.log(typeof schedules)
	
	// 데이터를 받은 쪼ㅓㄱ에서는 문자열로 받은 것을 자바스크립트 객체로 변환하는 메소드
	const receive = JSON.parse(str)
	document.write(receive)
	console.log(receive)
	console.log(typeof receive)
	