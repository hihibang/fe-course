/*
    배열에서 검색하려는 요소를 반환, 없으면 undefind 반환
    - 배열객체.find(callback)
    - 하나의 요소만 반환
*/
let fluits = new Array('🍋', '🍓', '🍏', '🍑', '🍊')
let findObj = fluits.find(fluit => (fluit === '🍊'))
console.clear()
console.log(`fluitObj = ${findObj}`);

let findIdx = fluits.findIndex(fluit => (fluit === '🍊'))
console.log(`fluitIdx = ${findIdx}`);
