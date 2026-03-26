/*
    Date Class 날짜 형식을 지원하는 클래스
    new Date() 클래스 생성 후, 생성된 객체이 메소드 호출
    getFullYear(), getMonth(), getDay() ...
*/

let date = new Date();
let date2 = Date.now();
let year = date.getFullYear();
let month = date.getMonth() +1
let day = date.getDate()
let week = date.getDay()

console.clear()
console.log(date);
console.log(date2);
console.log(year);
console.log(month);
console.log(day);
console.log(`오늘은 ${year}년 ${month}월 ${day}일 입니다.`);
console.log(date.toLocaleDateString('ko-kr'));
console.log(date.toLocaleDateString('en-us'));


