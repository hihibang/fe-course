/*
    String 문자열 Class
    - character를 하나씩 배열에 저장
    - splite(), slice(), chaAt(), toUpperCase()
    - 공백도 하나의 문자
*/
let str = '홍길동'
let strObj = new String('홍길동')

console.clear()
console.log(str, typeof str);
console.log(strObj, typeof strObj);
console.log(str == strObj);
console.log(str === strObj);

console.log();

let str2 = 'Hi JavaScript'
console.log('length: ', str2.length);
console.log('charAt(가져오고 싶은 문자 위치): ', str2.charAt(3));
console.log('toUpperCase(): ', str2.toUpperCase());
console.log('toLowerCase(): ', str2.toLowerCase());
console.log(str2 + ' next React Programming');
console.log(str2.concat(' next React Programming'));

let str3 = '          Hello~ React Programming.     '
console.log('trim()(앞 뒤 공백 삭제):', str3.trim());
console.log('trim()(뒤 공백 삭제):', str3.trimEnd());
console.log('trim()(앞 공백 삭제):', str3.trimStart());

// 문자열을 구분자를 이용하여 배열객체로 생성
let fluits = 'apple, lemon, orange'
let fluitsList = fluits.split(',')
let fluits2 = 'apple lemon orange'
let fluitsList2 = fluits.split(' ') 
console.log(fluits, typeof fluits); //apple lemon orange string
console.log(fluitsList2, typeof fluitsList2); //[ 'apple', ' lemon', ' orange' ] Object
console.log(fluitsList, typeof fluitsList); //[ 'apple', ' lemon', ' orange' ] Object

//문자열 추출 - subString(), slice()
let str4 = 'Hello Java'
console.log(str4.substring(0, 5)); // 0~4
console.log(str4.slice(0, 5)); // 0~4

