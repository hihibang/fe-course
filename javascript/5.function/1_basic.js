/*
    함수 - 기능을 구현하고 있는 자바스크립트 ❗️객체❗️(Heep에 저장)

    1. 일발적인 함수 정의 - stack frame 생성되는 변수명은 '함수명'
    function 함수명(파라미터) {
    실행코드;
    return 반환값;
    }

    2. 화살표 함수 정의
    const 함수명 = (파라미터) => {
    실행코드;
    return 반환값;
    }

    3. 자바스크립트 엔진에는 빌트인 함수(내장 함수)가 포함되어 있음
    - parseInt(), parseDouble() ...

    4. 함수 호출: 함수명(파라미터)
*/

// parseInt(): 문자열을 정수로 변환
let str1 = '100'
let str2 = '100.3455'
let a = parseInt(str1);

console.log(str1, typeof str1);

console.log(a, typeof a);


// 일반 함수 선언
function funcSum() {
    console.log(10+20);
}

// 화살표 함수 선언
const arrowSum = () => {
    console.log(10+20);
}

// 함수 호출
funcSum(); // 위에서 아래로 차례로 실행하지 않아도 호출 가능 🅾️
arrowSum(); // 위에서 아래로 차례로 실행하지 않아도 호출 불가능 ❌ 🌟권장하는 방법