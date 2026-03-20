/*
    deep copy 깊은 복사 - structuredClone, Json.parse(JSON.stringify())
    객체의 딥 카피는 복사가 이루어진 원본 객체와 동일한 참조(동일한 기본 값을 가리키는)를 
    공유하지 않는 속성을 가진 복사본을 의미합니다. 그 결과, 소스나 복사본을 변경하면 
    다른 객체도 변경되지 않을 것이라고 확신할 수 있습니다. 
*/

let fluits = [
    {name: 'apple', emoji: '🍎'},
    {name: 'orange', emoji: '🍊'},
    {name: 'lemon', emoji: '🍋'}
]

let fluitsCopy = structuredClone(fluits)
console.log('----> structuredClone()');

console.log(fluits, typeof fluits);
console.log(fluitsCopy, typeof fluitsCopy);

fluits[0].emoji = '🍏'
fluitsCopy[0].name = 'lemon'
console.log(fluits);
console.log(fluitsCopy);

let fluitsCopy2 = JSON.parse(JSON.stringify(fluits))
console.log('----> Json.parse(JSON.stringify())');
console.log(fluits, typeof fluits);
console.log(fluitsCopy2, typeof fluitsCopy2);

fluits[0].emoji = '🍏'
fluitsCopy2[1].name = 'lemon'
console.log(fluits);
console.log(fluitsCopy);