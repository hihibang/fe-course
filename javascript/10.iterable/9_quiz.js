/*
    중복된 배열 객체를 받아, 종복을 제한 후 출력하는 함수
*/
console.clear()
function filter(array) {
    return new Set(array)
}
let numbers = [1,2,3,4,5,4,3,2,1,1,4]
console.log(numbers);
console.log(filter(numbers)); //배열의 요소 하나하나 체크
console.log(filter(['홍', '이', '호', '김', '이']));

let mySet = new Set()
mySet.add(100)
mySet.add('홍길동')

console.clear()
let setArray = new Array(mySet) //객체 주소가 들어감
console.log(setArray);
console.log(setArray[0]);

console.clear()
const getObject1 = () => {
    return {
        name:'홍길동',
        age:30,
        job:'개발자',
        adress:'서울 성동구'
    }
}

const getObject2 = () => {
    return [1,2,3,4,5]
}

let {name, age, job, adress} = getObject1()
// let [...numbers2] = getObject2()
let [n1,numbers2,n3,n4,n5] = getObject2()
console.log(name, age, job, adress);
console.log(n1,numbers2,n3,n4,n5);


// textList 입력받아 3글자 이상의 text면 새로운 배열 생성
const textFilter = (textList) => {
    return textList.filter(text => text.length >= 3)
}
const textFilter2 = (textList) => {
    return textList.filter(text => !(text.length >= 3))
}
console.clear()
let result = textFilter(['javaScript', 'CSS', 'HTML', 'React', 'Aa', 'Bb'])
let result2 = textFilter2(['javaScript', 'CSS', 'HTML', 'React', 'Aa', 'Bb'])
console.log(result);
console.log(result2);

