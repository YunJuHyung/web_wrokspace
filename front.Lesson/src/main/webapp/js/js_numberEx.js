/**
*
*/

const calculate = () =>{
	//데이터를 가져올 요소를 변수에 저장하기
	const op1 = document.getElementById('operand1');
	const op2 = document.getElementById('operand2');
	const op = document.getElementById('operator');
	let result;
	
	switch(op.value){
	case '+':
	result = Number(op1.value) + Number(op2.value)
	break;
	
	case '-':
	result = op1 - op2
	break;
	
	case 'x':
	result = op1 * op2
	break;
	
	case '/':
	result = op1 / op2
	break;
	defalut:
		alert('알 수 없는 연산입니다.')
	}
	
	 document.getElementById('result').value=result
}
//버튼에 이벤트 추가
document.getElementById('executeBtn').addEventListener('click',calculate);
