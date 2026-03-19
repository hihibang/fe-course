/*
    call by value: 데이터 중복 시 주소 복제
    - 값이 heep에 저장되어 있는 경우
*/

let name1 = "홍길동";
let name2 = name1;
let name3 = new String('홍길동'); // 무조건 Heep
let name4 = name3;

console.log(name1, typeof name1);
console.log(name2, typeof name2);
console.log(name1 === name2);

console.log(name3, typeof name3);


let nlist = [1, 2, 3, 4, 5];
let nlist2 = nlist;

let person = {
    name: '홍길동',
    age: 30
}
let person2 = person;

console.log(nlist, typeof nlist);
console.log(nlist2, typeof nlist2);
console.log(nlist == nlist2);
console.log(nlist === nlist2); //nlist, nlist2의 객체주소와 타입 동일여부 비교
console.log(nlist[2] === nlist2[2]); //nlist, nlist2의 값과 타입 동일여부 비교

console.log(person, typeof person);
console.log(person2, typeof person2);
console.log(person == person2);
console.log(person === person2);

person2.name = '이순신';
console.log(person.name, person2.name);
// 똑같은 주소값을 참조했기 때문에 person2의 이름만 바꿔도 같은 주소를 가진 person의 이름도 바뀐다.


