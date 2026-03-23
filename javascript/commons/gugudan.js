// 싱글 구구단 정의
export function singleGugudan(dan) {
    console.log(`${dan}단을 외자!`);
    for (let i=1; i<10; i++) {
        console.log(`${dan} x ${i} = ${dan*i}`);
    }
    console.log();
}

// 멀티 구구단 정의
export function multiGuguden(dan1, dan2) {
    console.log(`${dan1}단부터 ${dan2}까지 외자!`);
    
    for (let i=1; i<10; i++) {
        let row = '';
        for (let j = dan1; j <= dan2; j++) {
            row += `${j} x ${i} = ${j*i}\t`;
        }
        console.log(row);
    }
}