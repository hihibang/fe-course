/*
    shallow_copy: 얕은 복사 - Array.from(original)
    객체의 얕은 복사본은 복사본이 만들어진 원본 객체와 동일한 참조(동일한 기본값을 가리키는) 속성을 
    공유하는 복사본을 의미합니다. 그 결과, 소스나 복사본을 변경하면 다른 객체도 변경될 수 있습니다. 
    그 행동은 소스와 복사본이 완전히 독립된 딥 카피의 동작과 대조됩니다.

    🌟 객체 요소가 원시데이터인 경우에는 독립적으로 관리되고,
       객체의 요소가 참조 데이터 타입 경우에는 주소가 공유된다.
*/
let fluits = ['apple', 'orange', 'lemon']
let fluitsCopy = Array.from(fluits)
console.log(fluits, typeof fluits);
console.log(fluitsCopy, typeof fluitsCopy);

fluitsCopy[0] = 'mango'
fluits[0] = '🍎'
console.log('fluits가 원시 데이터, fluits만 변경.');
console.log(fluits, typeof fluits);
console.log(fluitsCopy, typeof fluitsCopy);

let fluitsOBJ = [
    {name: 'apple', emoji: '🍎'},
    {name: 'orange', emoji: '🍊'},
    {name: 'lemon', emoji: '🍋'}
]
let fluitsOBJCopy = Array.from(fluitsOBJ); 
fluitsOBJCopy[0].name = 'mango'
fluitsOBJCopy[0].emoji = '🥭'
console.log(fluitsOBJCopy);
