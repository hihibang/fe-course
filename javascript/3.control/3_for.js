/*
    제어문: 반복 실행
    - for: 반복 횟수를 알고 있을 때
    - while: 종료 시점을 알고 있을 때

    for ((실행순서)1️⃣초기값 ; 2️⃣조건절 ; 4️⃣증가값) {
        3️⃣실행문;
    }
    - 초기값 선언시 키워드는 let으로 정의

    
*/

//1️⃣초기값 - for 블록에서 사용되는 변수
//2️⃣조건절(boolean): 10보다 작거나 같을 때까지 반복, 결과는 T/F
//3️⃣실행문: 2번 조건절 결과가 T면 실행
//4️⃣증가값: 단항연산자(++) or 대입연산자 이용하여 값을 증가함
for (let i=1 ; i <= 10 ; i++ ) {
        console.log(`i= [${i}]`);
    }

const numbers = [1,2,3,4,5,6,7,8,9,10];
for (let i = 0 ; i <= numbers.length-1 ; i++) {
    console.log(`numbers ${i+1}번째 값: [${numbers[i]}]`)
}

// 과일이 레몬이면 이모지 출력
let fluits = ['apple', 'orange', 'lemon', 'mango', 'banana']
let emojis = ['🍎', '🍊', '🍋', '🥭', '🍌']

for (let i =0 ; i < fluits.length ; i++) {
    if (fluits[i] == 'lemon') {
        console.log(`${emojis[i]} 이모지를 찾았어요!`);
        break;
    } 
    else {
        console.log(`이 친구는 레몬이 아니라 ${fluits[i]} 입니다`);
    }
    
}