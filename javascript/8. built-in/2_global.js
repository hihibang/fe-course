/*
    전역 함수로 최상위 객체인 Window 객체에서 호출되는 함수
    호출방법: window.함수명
    객체명 생략 가능
    (window.)alert(), (window.)confirm(), (Number.)parseInt(window.parseInt)
    window는 브라우저에서 인식, 로컬에서는 인식 불가

    encodeURI(), decodeURI()
*/
let num = '123.4567';
let intNum1 = Number.parseInt(num)
let intNum2 = parseInt(num)
console.clear()
console.log(num, typeof num);
console.log(intNum1);
console.log(intNum2);

// URI 주소 인코딩, 디코딩
let = uri = 'https://www.naver.com?name=홍길동'
let encodeUri = encodeURI(uri);
let decodeUri = decodeURI(encodeUri)

console.log(uri);
console.log(encodeUri);
console.log(decodeUri);
