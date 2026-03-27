/*
    배열객체에서 필터링을 진행한 후 Shallow copy 진행 후 리턴
    - 배열객체.filter(callback)
*/
let strList = ['hong', 'smith', 'lee', 'james']
let fluits = [
    {name: 'apple', emoji: '🍎'},
    {name: 'lemon', emoji: '🍋'},
    {name: 'orange', emoji: '🍊'},
    {name: 'apple', emoji: '🍎'},
    {name: 'lemon', emoji: '🍋'},
    {name: 'orange', emoji: '🍊'}
]

// 4자 이상인 이름만 필터링
let filterObj = strList.filter((str) => str.length >= 4)
console.clear()
console.log(`filterObj = ${filterObj}`);

// name이 lemon인 객체를 출력
let filterFruit = fluits.filter((fluit) => fluit.name === 'lemon')
console.log(filterFruit);
let findFruit = fluits.find((fluit) => fluit.name === 'lemon')
console.log(findFruit.emoji);
// console.log(`filterFruit = ${filterFruit}`);
