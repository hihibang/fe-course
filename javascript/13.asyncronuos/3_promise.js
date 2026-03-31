/*
    비동기 로직(미래의 작업)을 구현하는 객체
    - resolve: 작업 성공시 반환
    - reject: 작업 실패시 반환
    - Promise 객체 생성
    const 프로미스객체 = new Promiss((resolve, reject)=>{비동기식 로직})
    - Promise 객체 호출
    객체.then(성공시 callback).catch(실패시 callback)
*/
console.clear()

//Promise 객체 생성
const promise = new Promise((resolve, reject)=>{
    let success = true
    if(success) {
        resolve('성공!')
    } else {
        reject('실패!')
    }
})

promise //비동기 객체
    .then((result)=>{
        console.log(result);
    }) //result: resolve가 return하는 결과 값
    .catch((error)=>{
        console.log(error);
    })
console.log(`--------프로그램 종료--------`);

