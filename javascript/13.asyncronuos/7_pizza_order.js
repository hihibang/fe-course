/*
    동기식 비동기식 => 피자 주문 로직
    1. 주문
    2. 피자만들기: 5초
    3. 배달
*/
console.clear()
async function pizzaOrder(name, adrress) {
    // 1. 주문
    console.log(`${name}님이 주문하셨습니다`);
    // 2. 피자만들기
    let makePizza = new Promise((resolve, reject) => {
        setTimeout(()=>{
            // console.log(`피자 만들었습니다`);
            resolve(`피자 만들었습니다 🍕🍕`);
        }, 5000)
    })

    await makePizza
        .then(resolve => console.log(`resolve----------> ${resolve}`))
        .catch(reject => console.log(`reject---------->`))

    // 3. 배달
    console.log(`${adrress}로 배달 시작합니다`);
    
    
    
}

pizzaOrder('홍길동', '서울 성동구 123');