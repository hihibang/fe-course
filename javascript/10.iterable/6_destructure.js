/*
    destructure object : 구조 분해 할당
    - 객체의 구조를 분해하여 변수에 자동으로 할당
*/
//1. 배열
let numbers = [1,2,3,4,5]
let aa = numbers[0]
let bb = numbers[1]

let [a,b, ...nlist] = numbers
console.log(a,b,nlist);

//2. 오브젝트 리터럴
console.clear()
let hong = {
    name : '홍길동',
    age : 32,
    job : '개발자'
}
// let {name, age, job} = hong;
// console.log(name, age, job);

const createObj = () => {
    return {
        name: 'apple',
        emoji: '🍎',
        color: 'red'
    }
}

console.clear();
// let pirce = 1000
// let source = '강원도'
let {price=1000, source='강원도', name, emoji, color} = createObj() // 구조분해를 하려면 프로퍼티 이름을 맞춰줘야 함
console.log(name, emoji, color, price, source);
