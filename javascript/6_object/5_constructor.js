/*
    생성자 함수를 통한 객체 생성
    객체의 틀을 활용하여 다수의 객체를 생성하는 함수
    첫 글자는 무조건 대문자
*/

// Object Literal
// const Fruit = {
//     name: '사과',
//     emoji: '🍎'
// }

// 생성자 함수로 생성되는 객체 틀 정의
function Fluit(name, color, emoji) {
    // let name = undefined 생략 가능
    this.name = name;
    this.color = color;
    this.emoji = emoji;
    
    this.display = () => {
        console.log(this.name, this.color, this.emoji);
    }
}

let apple = new Fluit('apple', 'red', '🍎')
let orange = new Fluit('orange', 'orange', '🍊')
let lemon = new Fluit('lemon', 'yellow', '🍋')
apple.display();
orange.display();
lemon.display();

// 성적 리스트 관리
// 홍길동, 스미스, 이순신, 김유신, 제임스 학생 관리
// name, kor, eng, math의 필드값을 가지는 성적 탬플릿 생성자 함수 정의
// display 함수로 전체 데이터 출력
function Score(name, kor, eng, math) {
    // let name = undefined 생략 가능
    this.name = name;
    this.kor = kor;
    this.eng = eng;
    this.math = math;
    
    this.display = () => {
        console.log(this.name, this.kor, this.eng, this.math);
    }
    // 총점 반환
    this.sum = () => {
        return this.kor + this.eng + this.math
    }
    // 평균 반환
    this.avg = () => {
        return parseInt(this.sum()/3);
    }
}

// 성적리스트 객체 함수
function createScoreList(st1, st2, st3, st4, st5) {
    return {st1, st2, st3, st4, st5}
}

// new를 빼버리면 만들어진 변수가 전역변수로 올라감
let score1 = new Score('홍길동', 100, 100, 100);
let score2 = new Score('스미스', 60, 100, 80);
let score3 = new Score('이순신', 60, 30, 100);
let score4 = new Score('김유신', 100, 70, 100);
let score5 = new Score('제임스', 20, 100, 50);

let scoreList = createScoreList(score1, score2, score3, score4, score5)

console.clear();
// score1.display();
// score2.display();
// score3.display();
// score4.display();
// score5.display();
// console.log();
// console.log(scoreList);

console.log(`${score1.name} 총점/평균 = ${score1.sum()}/${score1.avg()}`);
console.log(`${score2.name} 총점/평균 = ${score2.sum()}/${score2.avg()}`);
console.log(`${score3.name} 총점/평균 = ${score3.sum()}/${score3.avg()}`);
console.log(`${score4.name} 총점/평균 = ${score4.sum()}/${score4.avg()}`);
console.log(`${score5.name} 총점/평균 = ${score5.sum()}/${score5.avg()}`);
