/*
    Rest Parameter: 파라미터 인자를 배열로 저장함
    - 함수의 매개변수에 정의함
    - funtion 함수명(...Rest Parameter)
    - const 함수명 = (Rest Parameter) => {}
*/
console.clear()
function add(a, b, ...numbers) {
    // let sum = numbers.reduce((acc, cur) => acc + cur) // (누적값, 현재값)
    // console.log(a, b, numbers);
    return a + b + numbers.reduce((acc, cur) => acc + cur)
}
const fadd = (f1, ...fruits) => { // ...fruits: Rest Parameter
    console.log(f1, fruits);
    // return {f1,  ...fruits}
    return [f1,  ...fruits]
}

let result1 = add(1,2,3,4,5);
let result2 = add(1,2,3,4,4,5,6,7,8,9)
console.log(result1);
console.log(result2);

let fruits = ['🍏','🍎','🍑','🍊','🍋']
fadd('🍏', fruits) // 🍏 [ [ '🍏', '🍎', '🍑', '🍊', '🍋' ] ]
fadd('🍏', ...fruits) // ...fruits: Spread Operator
// 🍏 [ [ '🍏', '🍎', '🍑', '🍊', '🍋' ] ]
let fobj = fadd('🍋', fruits);
console.log(fobj); //숫자가 먼저여서 순서 바뀜
// { '0': [ '🍏', '🍎', '🍑', '🍊', '🍋' ], f1: '🍋' }
