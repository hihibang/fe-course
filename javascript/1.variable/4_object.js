/*
    참조 데이터 타입: 객체(Object)
    - 배열(Array): [데이터, 데이터 ...]
    - 객체(Object): {'프로퍼티': 데이터, '프로퍼티': 데이터 ...}

*/

let apple = null; //객체 타입을 넣겠습니다
apple = {
    // 'name': 'apple',
    // 'color': 'red',
    // 'emji': '🍎'
    name: 'apple',
    color: 'red',
    emoji: '🍎'
}
console.log(typeof apple, apple);
console.log(apple.name);
console.log(apple.color);
console.log(apple.emoji);

let orange = {
    name : 'orange',
    color : 'corals',
    price : 3200,
    emoji : '🍊'
}
console.log(typeof orange);
console.log(orange);
console.log(orange.name);
console.log(orange.color);
console.log(orange.price);
console.log(orange.emoji);

// 배열 선언시 동일한 타입과 공통적인 속성을 저장하는 것이 좋음
//
let fluitlist = null;
// fluitlist = ['apple', '🍎', 100, 200, true]; // 다양한 데이터 타입 저장 🅾️, 비추천 ❌
fluitlist = ['🍊', '🍎','🥭','🍑','🍈']; // 다양한 데이터 타입 저장 🅾️, 비추천 ❌
console.log(fluitlist[0]);


// 객체 타입을 요소로 하는 배열 생성
let fluitObj =  null;
fluitObj = [apple, orange];
console.log(fluitObj);
console.log(fluitObj[0].name);
