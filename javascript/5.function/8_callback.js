/*
    callback 함수 - 함수 파라미터에 입력되는 익명 함수
*/

const job = (a, b, callback) => {
    // console.log(a, b);
    callback(a, b);
}
const print = (a, b)=> {console.log(a, b)}
const printSum = (a, b)=> {console.log(a + b)}

job(1, 2, print);
job(1, 2, printSum);

console.clear();
console.log('console에 로그 출력 #1 !!!');


// 비동기식 처리 함수 : setTimeout(funcRef(callback), delay);
// 항상 동기식 먼저 처리 후 비동기식 처리
// 내장함수 전역함수
setTimeout(() => {
    console.log(`console.log 실행 결과`);
}, 1000) // , 1초 후에 콜백 함수를 실행


console.log('console에 로그 출력 #2 !!!');


