/*
    callback : 함수의 인자에 입력되는 함수로직 anonymous(무기명) 함수
    - setTimeout(callback, delay)
*/
console.clear()
function runDely(callback, delay) {
    setTimeout(callback, delay)
}

runDely(()=>{console.log(`3초 후에 Task Queue에 들어감!!!!!`);}, 3000)
runDely(()=>{console.log(`1초 후에 Task Queue에 들어감!!!!!`);}, 1000)
runDely(()=>{console.log(`2초 후에 Task Queue에 들어감!!!!!`);}, 2000)

console.log(`------프로그램 종료!!!!!------`);
