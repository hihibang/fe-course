/*
    Map : key, value를 한쌍의 데이터로 가지는 객체
    -set(ket, value) : 데이터 추가
    -get(key) : 데이터 반환
    -has(key) : 데이터 체크
    -delete(key) : 데이터 삭제
*/
console.clear()
let fluitMap = new Map();
fluitMap.set('lemon', '🍋')
fluitMap.set('apple', '🍎')
fluitMap.set('verry', '🍓')
console.log(fluitMap);
console.log(fluitMap.get('lemon'));
console.log(fluitMap.get('apple'));
console.log(fluitMap.get('verry'));

// if(fluitMap.has('apple2')) {
//     console.log('🍎');
// } else {
//     console.log('사과 지금 만드는 중🎶');   
// }

// (fluitMap.has('apple2'))?
//     console.log('🍎') :
//     console.log('사과 지금 만드는 중🎶'); 

let emoji = (fluitMap.has('apple'))? '🍎' : '🍏'
console.log(emoji);  

// 데이터 ❌: 추가 데이터 🅾️: 업데이트
fluitMap.set('apple', '🍏')
console.clear()
console.log(fluitMap);

// 데이터 ❌: 추가 데이터 🅾️: 업데이트
if(fluitMap.has('verry')) {
    fluitMap.delete('verry')
} else {
    fluitMap.set('verry')
}
console.log(fluitMap);

//entries()
let fluitArray = fluitMap.entries()
// [Map Entries] { [ 'lemon', '🍋' ], [ 'apple', '🍏' ] }
console.log(fluitArray);



