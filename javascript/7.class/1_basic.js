/*
    class란? 객체를 생성하기 위한 설계도(틀)
    - 생성자 함수와 차이점
    - 객체지향언어의 클래스와는 다름
    - 자바스크립트에서 실행시 내부적으로 프로토타입 기반의 형식으로 실행됨
    - new 키워드 사용해서 객체 생성

    형식
    class 클래스명{
        //필드명(field)
        //생성자(Constructor)
        //메소드(Method)
    }    
*/

class Animal {
    //필드명(field) 변수 상수 > static으로 정의, class 변수/상수, 
    // staitic으로 정의된 변수/상수는 객체 생선 전 별도의 메모리(StackFrame)에 
    // 저장되어 호출 가능
    static MAX_SIZE = 10; //대문자로 주는 것은 상수(변하지 않음)
    static className = 'Animal'
    name = undefined; // let 생략 가능, 1. 선언
    // let name; JavaScript에서 선언 생략 가능, 객체 지향은 불가능
    // let emoji;
    
    //생성자(Constructor) 객체 생성 시 호출, new
    constructor(name, emoji) {
        this.name = name; // 2. 할당
        this.emoji = emoji;
    }
    //메소드(Method) 기능, 동작을 함수로 정의
    static display = () => {
        console.log(this.name, this.emoji);
    }
    // static 🅾️: 주소만 stackFrame에 올라가고, Heep에 실제 함수(객체) 저장
    //            class 안에 다양한 static 객체를 만들어도 class 객체 내부 안에만 존재한다. class라는 주머니가 static 객체들을 담고 있다 생각
    //            this는 display가 있는 class의 이름만 찾을 수 있기 때문에 이름인 Animal만 출력, 
    //            constructor(name, emoji)은 찾지 못해 undefined

}

console.log('Animal.MAX_SIZE=', Animal.MAX_SIZE);
console.log('Animal.className=', Animal.className);
let dog = new Animal('happy', '🐶') //Heep에는 실제 데이터가 들어가고, stackFrame에는 객체의 주소가 들어감
console.log(dog);
console.log(dog.emoji);
console.log(typeof dog);
// dog.display()
Animal.display();