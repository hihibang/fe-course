/*
    논리 연산자: &&(and), ||(or)

    논리식1(boolean, T/F 값을 가지는 식) && 논리식(boolean)2: 결과값(boolean)
    논리식1(boolean, T/F 값을 가지는 식) || 논리식(boolean)2: 결과값(boolean)
*/

let a = 3;
let b = 7;

console.log('---- && || ----');
console.log((a>b) && (a<b));
console.log((a==b) && (a<b));
console.log((a>b) && (a==b)); // ⚙️ahortcut
console.log((a!==b) && (a<b));

console.log((a>b) || (a<b));
console.log((a==b) || (a<b));
console.log((a>b) || (a==b)); // ⚙️ahortcut
console.log((a!==b) || (a<b)); // ⚙️ahortcut

//⚙️ 로그인 처리 시 (패스워드 && 아이디) 비교 로직을 구현
let userId = 'test';
let userPass = '1234';
if(userPass == '1234' && userId == 'test') {
    
}

