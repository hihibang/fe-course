/**
    단항 연산자: ++, --, !, !!
 */

let a = 10;
console.log(++a); //전위, 11
console.log(a++); //후위, 11
console.log(a); // 12

let b = 10;
console.log(b--); // 9
console.log(--b); // 8

let flag = true;
console.log(flag);
console.log(!flag); // t > f
console.log(!!flag); // f > t, 뒤로 돌아가기
