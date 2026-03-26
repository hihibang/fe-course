/*
    Math Class
    모든 메소드와 속성이 static로 정의되어 있음
    호출: Math.메소드명(), Math.속성
*/
let a = 1234.5678
console.clear()
console.log('Math.abs(value)(절대값) :: ', Math.abs(a));
console.log('Math.floor(value)(소수점 삭제) :: ', Math.floor(a));
console.log('Math.trunc(value)(소수점 삭제) :: ', Math.trunc(a));
console.log('Math.round(valu)(반올림) :: ', Math.round(a));
console.log('Number.toFixed(자릿수)(반올림) :: ', a.toFixed(1));
console.log('Math.max(valu) :: ', Math.max(1,2,3,4,5));
console.log('Math.min(valu) :: ', Math.min(1,2,3,4,5));
console.log('Math.random() :: ', Math.random()); // 0~1

const randNum = () => Math.floor((Math.random()*100+1))
let number = Math.floor((Math.random()*100+1))

console.log();
console.log('1~100 :', number);
console.log('1~100 :', randNum());
