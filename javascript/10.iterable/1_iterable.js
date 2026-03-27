/*
    Iterable(순회) Object: Iteration Protocol을 준수하는 객체
    - 자동으로 순회하는 객체
    - for (.. of ..) 문
    - String, Array, Set, Map
    - ...(Spread Operator: 스프레드 연산자, 전개구문): 블록안에서 객체의 데이터를 전개함(펼쳐 놓는다) 
    - ...(Rest Parameter): 매개변수 모든 값을 배열로 저장, 파라미터에 들어가는 것
    - ...(구조분해 할당): 객체를 분해한 후 변수에 할당
*/
//String 객체 생성 후 for .. of
let strList = new String('Hello~ JavaScript')
for( str of strList ) {
    console.log(str);
}

//Number 객체 생성 후 for .. of ❌
//Number CLass는 Iteration Protocol을 준수하지 않음
// let numbers = new Number(12345)
// for(let number of numbers) {
    //     console.log(number);
    // }
    
let numbers = [1,2,3,4,5]
console.clear()
for(number of numbers) {
    console.log(number);
}
console.log();
numbers.forEach(number => console.log(number))

console.log();
let findnum = numbers.find(number => number === 3)
console.log('findNum =',findnum);

let findIndex = numbers.findIndex(number => number === 3)
console.log('findIndex =', findIndex);

// 자바스크립트에서는 1을 True라고 인식하기 때문에 == 0 생략 불가 
// 혹은 !() 반대로 변환 <= 🌟
let filterNum1 = numbers.filter(number => !(number%2))
let filterNum2 = numbers.filter(number => number%2)
console.log('filterNum 짝수 = ', filterNum1);
console.log('filterNum 홀수 = ', filterNum2);

//map() 모든 요소에 + 10
let mapNum = numbers.map(number => number+10)
console.log('mapNum =',mapNum);
