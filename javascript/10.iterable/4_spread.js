/*
    Spread Operator(전개 구문)
    - 객체가 가지고 있는 요소를 펼처 놓음(전개함)
    - Iterable object, object literal
    - 함수 호출 : 예) myFuntion(...객체명);
    - 배열, 스트링, 오브젝트 리터럴 : 예) let testArray = [...객체명];
*/
// 배열 객체 복사 :: 약한 복사 - 새로운 객체 생성(요소:원시데이터-독립. 참조데이터-공유)
console.clear()
let numbers = [1,2,3,4,5]
// let copyNumbers = Array.from(numbers)
let copyNumbers = [...numbers]
let concatNumbers = [...numbers, 100, ...copyNumbers]

let copyNumbers1 = numbers // 주소공유


console.log(numbers, typeof numbers);
console.log(copyNumbers, typeof copyNumbers);
console.log(concatNumbers, typeof concatNumbers);

//오브젝트 리터럴 복사
let fluit = {
    name : 'apple',
    emoji : '🍏'
}
let copyFluit = {...fluit};
let updateFluit = {
    ...fluit,
    color : 'green'
}

console.log(fluit, typeof fluit);
console.log(copyFluit, typeof copyFluit);
console.log(updateFluit, typeof updateFluit);

let list = [ // 깊은 복사, 주소 공유 ❌, 독립적인 객체 생성
    {...fluit},
    {...copyFluit},
    {...updateFluit}
]

console.log(list, typeof list);


