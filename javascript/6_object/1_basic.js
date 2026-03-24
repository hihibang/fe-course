/*
    Object
    - { }, 다양한 데이터 타입을 저장
    - object literal, { property(key): value }
    - JSON(JavaScript Object Notation)에서는 proprerty(key)를 반드시 문자열로 정의
*/

// 학생의 성적을 관리하는 객체 생성, object litieal
// const로 만들어진 객체도 프로퍼티를 통한 값 수정 및 삭제가 가능하다.
const hong = {
    name : '홍길동',
    age : 32
}

// 1. 프로퍼티를 통한 값 수정
hong.name = '홍길순'
hong.age = '27'

// console.log(hong(name)); 내부에서만 가능한 방법

// 3. 프로퍼티를 통한 값 삭제
delete hong.name

console.log(hong);
console.log(hong.name);
console.log(hong.age);

