/*
    함수는 객체(Object) 이고, Heep에 저장됨
    일반적인 함수형식(function)로 선언되면, 호스팅되어 전역으로 맨 먼저 힙에 저장
*/

function add1(num1, num2) {
    console.log(`sum = ${num1+num2}`);
}

add1(100, 10)