//5. 얕은 복사

const sfluit = ['🍎', '🍋', '🍑']
const sfluit1 = sfluit.slice(0, sfluit.length)
const sfluit2 = Array.from(sfluit);

// 배열의 요소가 원시데이터 타입이면 독립적 생성
sfluit[0] = '🍓'
console.clear()
console.log(sfluit);
console.log(sfluit1);
console.log(sfluit2);

const sfluitObj = [
    {name: 'orange', emoji: '🍊'},
    {name: 'mango', emoji: '🥭'},
    {name: 'lemon', emoji: '🍋'}
]
const sfluitObj1 = sfluitObj.slice(0, sfluitObj.length)
const sfluitObj2 = Array.from(sfluitObj);

// 배열의 요소가 참조데이터(객체) 타입이면 객체 주소 공유
sfluitObj[0].emoji = '🍎'
console.clear()
console.log(sfluitObj);
console.log(sfluitObj1);
console.log(sfluitObj2);

//6. concat : 배열 객체 결합
let arr1 = [1,2,3]
let arr2 = [4,5,6]
let arrConcat = arr1.concat(sfluit).concat(arr2)
console.clear();
console.log(arrConcat);

//7. join: 배열 객체를 구분자로 구분하여 문자열로 반환
console.clear()
console.log(arrConcat);

let strJoin = arrConcat.join('-')
console.log(strJoin, typeof strJoin);

let spliteArray = strJoin.split('-')
console.log(spliteArray, typeof spliteArray);

