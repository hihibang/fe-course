/*
    객체 생성 모듈
*/
let objects = {}; // {hong:{}, kim:{}}

export function getObjects() { // 전체 리스트
    return objects;
}

export function createObject(objectName) { // 객체 생성
    return objects[objectName] = {};
}
export function deleteObject(objectName) { // 객체 삭제
    delete objects[objectName];
}
export function getObject(objectName) {
    return objects[objectName];
}

export function setObject(key, value) { // 키값, 
    objects[key] = value;
}
/*
    object: {
    apple(key) {
        name: 'apple'
        emoji: '🍎'
        }
    }
*/

// 객체 관리 CRUD 모듈
// C(Create), R(Read), U(Update), D(Delte)

// 1. 객체에 값을 추가하는 함수 정의, 모든 객체에서 사용할 수 있도록 일반화
export function setValue(object, key, value) {
    object[key] = value;
}
// 2. 객체 값 반환
export const getValue = (object, key) => {
    console.log(object[key]);
}
// 3. 객체 값 업데이트
export function updateValue(object, key, updateValue) {
    object[key] = updateValue;
}
// 4. 객체 값 삭제
export function deleteValue(object, deleteKey) {
    delete object[deleteKey];
}

/*
    생성자 함수를 이용한 객체 CRUD
*/
export function Fruit(name, emoji) {
    this.name =name;
    this.emoji =emoji;

    this.display = () => {
        console.log(this.name, this.emoji);
    }
}