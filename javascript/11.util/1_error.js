/*
    try~catch~finally : 자바스크립트에서 예외를 처리하는 구문
    - ~finally: 예외 발생에 상관없이 무조건 출력되는 구문
*/
let numbers = [1,2,3]
console.log(numbers[0]);
console.log(numbers[1]);
console.log(numbers[2]);

numbers[99] = 1000
console.log(numbers);

let numbers2 = new Number(12345)
try {
    for (number of numbers2) {
    console.log(number);
    }  
} catch (error) {
    console.log(`type Error !!!!!!!!`);
} finally {
    console.log(numbers2);
}

let numbers3 = new String('12345')
try {
    for (number of numbers3) {
    console.log(number);
    }  
} catch (error) {
    console.log(`type Error !!!!!!!!`);
}