/*
함수 생성 및 호출
*/ 
import { toNumber } from "../commons/utils.js";
   add1(100, 200);
   add1(300, 200);
   add1(200, 150);
   add1('100', '0');

// 두 수를 입력하여, 합계를 출력
// 호이스팅되어 add 함수 호출 전 메모리에 저장 됨.
function add1(num1, num2) { // num1, num2는 add에서만 존재하는 지역 변수
    let obj = toNumber(num1, num2);
    console.log(`sum = ${obj.num1 + obj.num2}`);
}

console.log();

//arrow function
// 호이스팅되지 않는다.
const add2 = (num1, num2)  => {
    let n1 = parseInt(num1)
    let n2 = parseInt(num2)
    console.log(`sum = ${num1 + num2}`);
}

let add3 = add1;

add2(100, 200);
add3(200, 300);

console.log(add1 === add3); // 주소 동일
