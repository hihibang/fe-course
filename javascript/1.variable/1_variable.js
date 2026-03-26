/*
    ES6 기준의 문법 형식 적용
    변수: 데이터를 메모리에 저장하는 공간
    변수 선언하는 키워드: 
    var(defalt)(2015년 후에는 잘 안씀)
    let
    const(상수: 변하지 않는 수)
    - var를 사용하여 진행하는 경우, 중복된 변수가 사용될 수 있음으로 권장❌
    - let 변수 선언, 데이터 수정 가능
    - const 상수 선언, 데이터 수정 블가능

    문법: [변수 선언 키워드] 변수명 = 데이터;
*/

let num = 100;
/* 변수의 입력되는 데이터 타입명이 달라도 오류가 안남: 동적 타입 */
num = 'hello'; 
/* let은 변수를 새로 만드는 것이기 때문에 변수 수정은 되지만, 
   이름은 같지만, 새로운 변수 생성 불가능 
*/
num = 300;
console.log(num);

const num2 = 100;
/* console.log(num2); 
   TypeError: Assignment to constant variable.
   const는 상수라 데이터 값 변경이 불가능 함
*/

// name 이라는 변수에 '홍길동' 데이터 저장
let name1 = '홍길동'
let name2 = '홍길동'
console.log('name =' ,name1, ',', name2);

// number 이라는 변수에 100 데이터 저장
let number = 100;
console.log('number =', number);

// DB 연동(비동기식 처리)

// flag 변수에 true 값 저장
let flag = true;
console.log(true);

// cname 변수에 상수로 '이순신' 저장
const cname = '이순신';
console.log(cname);