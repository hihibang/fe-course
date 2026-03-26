/*
    비교 연산자: >, <, >=, <=, ==(값), ===(값+데이터타입)
    - 결과값은 bollean
    - 제어문의 조건 비교시 사용, if, while
*/

let a = 3;
let b = 7;
console.log(a > b);
console.log(a < b);
console.log(a >= b);
console.log(a <= b);
console.log(a == b);
console.log(a === b);

const obj1 = {name: '홍길동', age: 30} 
const obj2 = {name: '홍길동', age: '30'}
console.log(obj1 == obj2); //객체는 무조건 다름
console.log(obj1 === obj2); 
console.log(obj1.name == obj2.name); 
console.log(obj1.name === obj2.name); 
console.log(obj1.age == obj2.age); 
console.log(obj1.age === obj2.age); 
