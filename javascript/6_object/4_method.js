/*
    객체를 생성하는 함수: 새성자 함수(Constucter Function)
    객체의 메소드 정의 : 객체안에 함수형식으로 정의
*/

const fluit = {
    // Field
    name : 'apple',
    emoji : '🍎',

    // Method
    getName : function() {return this.name;},
    getEmoji : function() {return this.emoji;},
    display : function() { console.log(this.name, this.emoji);},
    
    // this 키워드는 현재 객체에서만 사용되는 self object 키워드!, 다른 객체 안에서는 사용이 불가능하다
    // this.name은 property로 정의 ❌
    // display : function() { return {this.name, this.emoji};}
    display2 : function() { return { name: this.name, emoji: this.emoji};}
}
console.log(fluit.display());
console.log(fluit.display2());
console.log(fluit.getName()); // 함수니깐 ()붙여줘야 함
console.log(fluit.getEmoji());
