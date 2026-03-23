// 데이터타입에 상관없이 add 함수가 실행되도록 문자 > 변환하는 함수 생성
// export: 다른 파일에서도 함수 호출 가능
export function toNumber(num1, num2) {
    return {
        num1: parseInt(num1), 
        num2: parseInt(num2)
    };
}