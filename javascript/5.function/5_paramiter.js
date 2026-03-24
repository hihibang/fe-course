/*
    함수호출 > 파라미터(인자, 입력된 값) 함수의 (지역)변수에 자동 매핑
*/
console.log(add(1,2,3,4,5));
console.log(add(1,2,3,4,5,6));
console.log(add(1,2,3,4,5,6,7));
console.log(add(1,2,3,4,5,6,7,8));

function add(... args) {
    // 배열 객체의 원소가 숫자이면서 누적합을 구하는 경우
    // 🌟한줄로 진행할시 {}, return 키워드 생략 가능 
    let sum = args.reduce((sum, curValue) => /* { */
        /* return */sum + curValue
    /* } */);
    // 🌟return 키워드를 무조건 사용해줘야 함
    return sum;
}

console.log(add2('홍길동',20, 1, 2, 3, 4, 5));
let obj = add2('홍길동',20, 1, 2, 3, 4, 5);
console.log(obj.name);
console.log(obj.age);
console.log(obj.score);

function add2(name, age, ... args) {
    // let sum = 0;
    // for(i=0; i<args.length; i++) {
    //     sum += args[i];
    // }
    let sum = args.reduce((acc, cur) => acc+cur);
    return {
        name: name,
        age: age,
        score: sum
    }
}

