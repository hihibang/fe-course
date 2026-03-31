/*
    동기식(sync) vs 비동기식(async)
    (1) 동기식
    - 순차적으로 *한번에 하나씩* 작업 진행
    - 코드 실행 > call stack > 바로 처리

    (2) 비동기식
    - 대량의 작업을 모아서, 나중에 처리 => Call stack이 비어있는 상태
    - 코드 실행 > call back > web API(크롬), Background(Nodejs)영역에 저장
        > Task Queue 순차적으로 저장 
        > call stack이 비어있으면...
        > Event Loop 객체가 Task Queue에 있는 작업들을 call stack으로 보냄
        > call stack이 작업 추리 후 종료
    - setTimeout(), fatch(), axios(), DB 연동, 파일 I/O, ...
*/
console.clear()
function a() {
    b() // return address
    setTimeout(()=>{console.log(`Task Queue에 바로 저장됨!!!!!!!`);
    })
    console.log(`-------> a`);
}
function b() {
    setTimeout(()=>{console.log(`Task Queue에 1초후엩 바로 저장됨!!!!!!!`);
    }, 1000)
    console.log(`-------> b`);
}
function c() {
    a(); //return address : 밖에 있는 작업을 처리하고 다시 돌아옴
    console.log(`--------> c`);
}

c()