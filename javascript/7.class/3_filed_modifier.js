/*
    클래스 필드에 선언되는 변수/상수에 대한 접근 제한자.
    외부에서 접근하지 못하게 제한하는 것.
    변수/상수 앞에 #을 붙이면 private 설정, 클래스 내에서만 접근 🅾️ 외부 접근 ❌
    #이 붙지 않으면 public 설정, 클래스 내에서만 접근 🅾️ 외부 접근 🅾️
    #을 붙이기 위해서는 filed에 정의
*/

class Person {
    #empno;
    name;
    age;

    constructor(empno, name, age) {
        this.#empno = empno
        this.name = name
        this.age = age
    }

    display = () => {
        console.log(this.#empno, this.name, this.age);
    }
    setEmpno = (empno) => {
        this.#empno =  empno; 
    }
    getEmpno = (empno) => {
        return this.#empno;
    }
}

let hong  = new Person('1234','홍길동', 40);

console.clear()
console.log(hong.name);
console.log(hong.age);
console.log(hong.empno); // 외부에서는 # 못붙침, 접근만 가능

hong.empno = '4567'; //사번 변경 불가
hong.display()
console.log(hong.getEmpno());
hong.setEmpno('3456')
hong.display()
console.log(hong.getEmpno());
