/**
    사칙연산: +, -, *, /, %(모듈러, 나머지연산자), **지수연산자 
 */

let a = 3;
let b = 5;
console.log(a+b);
console.log(a-b);
console.log(a*b);
console.log(a/b);
console.log(a%b);
console.log(a**b);

// 짝수 홀수 선택 > %
let number = 100;
let number2 = 101;
console.log(number % 2);
console.log(number2 % 2);

// 접합 연산자(+): '문자열' +(접합 연산자) '문자열'
console.log('10' + 20); // 1020
console.log(10 + 20); // 30
console.log('합계: ' + (10 + 20)); // 합계: 30
console.log('합계: ' + 10 + 20); // 합계: 1020
