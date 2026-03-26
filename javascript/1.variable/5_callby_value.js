/*
    call by value: 데이터 중복 시 값 복제
    - 값이 stack에 저장되어 있는 경우
*/

let number = 100;
let cnumber = number;

let flag = true;
let cflag = flag;

console.log(number, typeof number);
console.log(cnumber, typeof cnumber);
console.log(number === cnumber);
console.log();
console.log(flag, typeof flag);
console.log(cflag, typeof cflag);
console.log(flag === cflag);

number = 200;
console.log(number, cnumber);
// 값만 저장되기 때문에 둘의 값이 다르다

