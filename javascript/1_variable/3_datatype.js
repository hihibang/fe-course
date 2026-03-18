/*
    Primitive DataType(원시형 데이터 타입)
    - 정수형(Inter): 100, 200 ... (64bit: -2** 31 ~ 2**31-1)
    - 실수형(Float, Double): 3.14
    - 문자형(Character): '', ""
    - 불린형(Boolean): true(1), false(0)
    ⚙️ 정수형 범위 (64bit: -2** 31 ~ 2**31-1)안의 정수 선언시 Stack Frame에 저장됨
    ⚙️ 정수형 범위 (64bit: -2** 31 ~ 2**31-1)를 넘어서면 Heep에 저장됨
    ⚙️ 실수형, 문자형은 데이터는 Heep에 저장 후 포인터(변수)는 Stack Frame에 저장 
    
    Reference DataType(참조형 데이터 타입)
    - 객체형(Object {}), 배열(Array[]), 클래스(class), JSON(객체형, 배열 모두 포함)
    ⚙️ 참조형 데이터 타입은 무조건 Heep에 저장됨
*/

// 1. 정수형
let inumber1 = 2**31-1;
let inumber2 = 2**31;
console.log(inumber1, inumber2);

// 2. 실수형
let fnumber = 1234.12345467;
console.log(fnumber);

// 3. 문자형
let name = '홍길동'
let cname = '홍길동'
console.log(name);
console.log(cname);

// 4. 불린형
let flag = true;
console.log(flag);

// 5. 배열
let nameArray = ['홍길동', '이순신', '김유신'];
console.log(nameArray);

// 6. 객체(object)
let obj = {
    "name": "홍길동",
    "age": 30
}
console.log(obj);

// 7. JSON
let jsonObj = {
    "name": "홍길동",
    "score": [100, 90, 95]
}
console.log(jsonObj);

// 8. 초기화 값 객체
let x = undefined; // Primitive 초기화
let xy = null; // Reference 초기화

// 9. TypeOf : 데이터 타입 확인
let xx = 10;
let yy = '10';

console.log('------> 데이터 타입 확인')
console.log(xx, typeof xx);
console.log(yy, typeof yy);

console.log('------> 데이터 타입 확인 및 비교')
console.log(typeof xx == typeof yy); // 값만 비교, typeof 포함시 데이터타입 비교
console.log(xx === yy); // 자체적으로 값 + 타입 비교
console.log(xx == yy); // 값 비교