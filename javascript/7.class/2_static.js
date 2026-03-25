/*
    static 상수, 메서드 정의 - 클래스 상수, 클래스 메서드
    static 키워드가 붙은 상수, 메서드
    - 호출 시: 클래스 상수, 클래스 메서드
    - static이 붙은 상수, 메서드는 stack의 static 메모리 영역에 별도 저장되므로,
    객체 생성 전 호출이 가능
*/

class Fruit {
    //filed
    static MAX_SIZE = 10;
    // name; 생략 가능
    // color;
    // emoji;

    //constructor
    // a, b, c constructor에서만 살아있기 때문에 
    // 다른 곳에서도 사용하기 위해 전역 변수(this)안에 넣는 것❗️
    constructor(name, color, emoji) { 
        this.name = name;
        this.color = color;
        this.emoji = emoji
    }

    //method
    // 저장되는 메모리 공간이 달라서 Error가 안남
    static getName = () => {return this.name}
    getName = () => {return this.name}
    
    static create = (name, color, emoji) => {
        return new Fruit(name, color, emoji);
    }
}

console.clear();
console.log(Fruit.getName());

let apple = new Fruit('apple', 'red', '🍎')
console.log(apple);
console.log(apple.getName());

let lemon = Fruit.create('lemon', 'yellow', '🍋')
console.log(lemon.getName());
console.log(lemon);
