/*
제어문: 조건 분기 
switch(조건: 숫자, 문자){
    case 숫자, 문자: 
        실행문 ; 
    break; 
    case 숫자, 문자: 
        실행문 ; 
    break;
    ..
    defalt: 실행문; //조건절에 해당하는 숫자, 문자가 없는 경우
    }
*/

//0:월요일 1:화요일 2:수요일
let result = undefined;
switch (2) {
    case 0:;
        // console.log('월요일');
        result = '월요일';
        break;
    case 1:
        // console.log('화요일');
        result = '화요일';
        break;
    case 2:
        // console.log('수요일');
        result = '수요일';
        break;
    default: 
        console.log('요일을 선택해 주세요');
        break;
}
console.log(`선택한 요일은 [${result}] 입니다`)

//입력받은 숫자가 홀수면 사과, 짝수면 오렌지
let number = 100;
let fresult = undefined;

switch (number%2) {
    case 1:
        fresult = '🍎';
        break;
    case 0:
        fresult = '🍊';
        break;
    default:
        console.log('숫자를 입략해주세요')
}

console.log(`선택한 과일은 [${fresult}] 입니다`);
