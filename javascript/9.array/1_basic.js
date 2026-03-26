/*
    배열 
    - 동일한 데이터 타입을 가지고 있는 요소를 물리적인 공간(Heep)에 연속적으로 저장
    - 배열은 참조데이터 타입이며, Heep에 생성
    - [], Array 클래스를 이용하여 객체 생성
    - 배열 객체 요소는 기본형, 참조형 모두 저장 가능
*/

let array1 = [];
let array2 = new Array(2);
let array3 = new Array(5);

console.clear()
console.log(array1.length, array2.length, array3.length);

let numbers = [1,2,3,4,5]
let fluits = new Array('🍏', '🍋', '🍒')

console.log(numbers.length);
console.log(fluits.length);

// 1요소 추가: push()
numbers.push(6)
fluits.push('🍑')

console.log(numbers);
console.log(fluits);

// 2요소 출력: keys()
let itNumbers = numbers.keys()
console.log(itNumbers);
for(let key of itNumbers) {
    console.log(`key = ${key}`);
}

// for..(값을 저장하는 변수 선언 of 반복 실행하는 객체) : 확장 for문 - for 내부에서 index 관리
// for (let number of numbers){
//     console.log(`number = ${number}`);
// }
// for (let fluit of fluits){
//     console.log(`fluit = ${fluit}`);
// }

//3. 요소 삭제: pop(), splice()
//3.1. 마지막 요소 삭제
console.log(fluits);
console.log(`fluits.pop() = ${fluits.pop()}`);
console.log(fluits);
console.log();

//3.2. 선택적 요소 삭제 및 교체
// splice(시작인덱스, 삭제갯수)
// splice(시작인덱스, 삭제갯수, 교체아이템)
fluits.splice(0, 1)
console.log(fluits);
fluits.splice(0, 1, '🥭')
console.log(fluits);

// 삭제 안하고 요소 추가
fluits.splice(0, 0, '🍎')
console.log(fluits);

//4. 요소 추출: slice(시작, 종료): 새로운 배열 객체 반환
console.clear()
console.log(numbers);
let subNumbers = numbers.slice(0, 3)
console.log(subNumbers);

//5. 얕은 복사
// 배열의 요소가 원시데이터 타입이면 독립적 생성
// 배열의 요소가 참조데이터(객체) 타입이면 객체 주소 공유

