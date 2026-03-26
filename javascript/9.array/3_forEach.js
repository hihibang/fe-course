/*
    forEach 메소드는 Iterator 심볼 객체를 상속한 객체에서 사용됨
    - Iterator 상속 객체.forEach(callback)
    - Iterator 심볼 객체: 안에서 인덱스를 자동으로 관리
    - Array(배열).forEach(요소, 인덱스, 배열))
    - callback: 함수의 파라미터에서 함수의 형식이 들어감 함수(() => {})
*/

let numbers = [1,2,3,4,5,6]
console.clear()
numbers.forEach((number, i, obj) => console.log(`numbers[${i}] = ${number}, ${obj}`))

let fluits = new Array('🍏', '🍋', '🍒')
fluits.forEach(fluit => console.log(`fluits = ${fluit}`));
fluits.forEach((fluit, i) => console.log(`fluits[${i}] = ${fluit}`));

// 🍋 > 🍓
fluits.forEach((fluit, i) => {
    if(fluit === '🍋') {
        fluits.splice(i, 1, '🍓')
    }
})
console.log(fluits)

// 🍓 > 🍋 for ..of
let i = 0;
for(let fluit of fluits) {
    if(fluit === '🍓') {
        fluits.splice(i, 1, '🍋')
    } else {
        i ++
    }
}
console.log(fluits);
