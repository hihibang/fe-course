/*
    return: 함수 실행 결과를 반환 키워드
    반환 결과 1개 값 > 변수
    반환 결과 1개 이상 값 > 객체
*/
function add1() {
    //console.log(1+2);
    return 1+2
    // 작업이 끝났다고 알려주는 반환 키워드
}
let result =  add1(); // add1 함수가 모든 일을 끝맞춰야 호출도 끝남.
console.log(`result = ${result}`);
console.log('add1 = ' + add1());

// name, age를 입력받아 객체를 리턴하는 함수 생성

function creatOBJ(name, age) {
    return {
        name: name, //키워드: 변수
        age: age
    }
}

let hong = creatOBJ('홍길동', 30);
let kim = creatOBJ('김나연', 24);
let lee = creatOBJ('이순신', 30)

console.log(hong);
console.log(hong.name);
console.log(hong.age);
console.log(kim);

// 홍길동, 이순신, 김유신 객체를 배열에 저장 출력
let objList = [
    hong,
    kim,
    lee
]

console.log(objList);

for (i=0; i<objList.length; i++) {
    let obj = objList[i]
    console.log('name = ', obj.name);
    console.log('age = ', obj.age);
}
