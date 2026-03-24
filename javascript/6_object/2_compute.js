// CRUD: 객체의 관점에서 만들고, 읽고, 업데이트하고, 삭제
import { setValue, getValue, updateValue, deleteValue } from "../commons/objct.js"

const person = {
    name : '홍길동',
    age : 30
}
console.log(person)

const apple = {
    name : 'apple' 
    // 이모지를 넣고 싶음
}

// 1. property, vlaue 추가
// key 값은 무조건 문자열이니 ' 키값 ' 으로 넣어야 함
setValue(person, 'address', '서울시 강남구')
setValue(person, 'job', 'Sw 엔지니어')
setValue(apple, 'emoji', '🍎')
console.log(person)
console.log(apple)
console.log();

// 2. property, value 가져오기
getValue(apple, 'emoji')
console.log();

// 3. property 값 업데이트
updateValue(apple, 'emoji', '🍏')
console.log(apple.emoji);
console.log();

// 4. property 값 삭제
deleteValue(person, 'address')
deleteValue(apple, 'name')
console.log(person);
console.log(apple);




