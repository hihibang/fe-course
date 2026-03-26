/*
    Number Class
    - valueOf(), toString() ...
*/
let a = 100;
let b = 1234567;
let aa = new Number(100)
let bb = new Number(1234567)

console.clear() 
console.log(a, typeof a);  // 100 number
console.log(aa, typeof aa);  // [Number: 100] object 
console.log(b, typeof b); // 1234567 number 
console.log(bb, typeof bb); // [Number: 1234567] object

console.log();
console.log(a.valueOf()); // 100, 자동변환, 원본 데이터 타입 유지
console.log(aa.valueOf());
console.log(b.valueOf()); // 1234567, 자동변환, 원본 데이터 타입 유지
console.log(bb.valueOf());

console.log(); 
console.log(a.toLocaleString()); // 100
console.log(aa.toLocaleString()); // 100
console.log(b.toLocaleString()); // 1,234,567
console.log(bb.toLocaleString()); // 1,234,567

console.log();
let localNumber = b.toLocaleString()
console.log(localNumber, typeof localNumber);

console.log();
let number = '123456743'
let locNumber = parseInt(number).toLocaleString()
console.log(locNumber);

console.log();
let fnumber1 = '1234.56743'
// Number.toFixed(), math.round()
let fnumber2 = parseFloat(fnumber1).toFixed() // 소수점 첫째자리 반올림
let fnumber3 = parseFloat(fnumber1).toFixed(2) // 소수점 셋째자리 반올림
let flocNumber = parseFloat(fnumber1).toLocaleString()
console.log(flocNumber);
console.log(fnumber2);
console.log(fnumber3);
