/*
    변수의 값을 객체의 값으로 정의하는 경우, property(key) 값 생략 🙆‍♀️
*/

let name = '홍길동'
let age = 30
let address = '서울 강서구'

let person = {
    //name : name,
    //age : age
    name, age, address
}
console.log(person);

// 두개의 값을 입력받아 객체로 리턴하는 함수
function createObject(x, y) {
    return {x, y}
}
const createObjectArrow = (x, y) => {
    return {x, y}
}
let num1 = createObject(1, 2);
console.log('num1 = ',num1);
let num2 = createObjectArrow(2, 2);
console.log('num2 = ', num2);

// 사원의 이름, 나이, 주소, 소속정보를 입력받아, 사원객체를 생성하고 반환하는 함수
// 매개변수와 return되는 프로퍼티만 맞춰주면 됨
const createEmployee = (name, age, address, department) => {
    return {name, age, address, department};
}

let emp1 = createEmployee('김나연', 24, '서울 관악구', '치즈파스타')
let emp2 = createEmployee('샘', 24, '서울 강동구', '토마토파스타')

console.log(emp1);
console.log(emp2);

/* 데이터 출력
for(let i = 0; i < empList.length; i++) {
    let rows = ''
    for(let j = 0; j<empList[i].length; j++) {
        rows += empList[i][j] + '\t';
        }
        console.log(rows);  
        }*/
       
 let empList = [
    ['김나연', 24, '서울 관악구', '치즈파스타'],
    ['샘', 24, '서울 강동구', '토마토파스타'],
    ['카린', 24, '서울 동작구', '로제파스타']
]
        
    console.clear()
    for(let i = 0; i < empList.length; i++) {
        let object = {};
        for(let j = 0; j<empList[i].length; j++) {
            if(j==0) object.name = empList[i][j]
            if(j==1) object.age = empList[i][j]
            if(j==2) object.address = empList[i][j]
            if(j==3) object.department = empList[i][j]
        }
        console.log(object);  
        }
        
    console.log()
    for(let i = 0; i < empList.length; i++) {
        let object = null; // 객체 초기화
        let name, age, address, department = undefined;
        // let age = undefined;
        // let address = undefined;
        // let department = undefined;
        for(let j = 0; j<empList[i].length; j++) {
            if(j==0) name = empList[i][j]
            if(j==1) age = empList[i][j]
            if(j==2) address = empList[i][j]
            if(j==3) department = empList[i][j]
        }
        // 함수의 파라미터 인자와 같지 않아도 괜찮음
        object =  createEmployee(name, age, address, department);
        console.log(object);  
        console.log();
    }