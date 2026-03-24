/* import { 
    getObject, 
    createObject, 
    deleteObject,
    getObject,
    setValue,
    getValue, 
    updateValue,
    deleteValue 
} from "../commons/objct.js"; */

import * as objct from '../commons/objct.js'

// 회원 주소록 생성
let addressBook = objct.getObjects(); //objects 주소 공유

// 1. 객체 생성
objct.createObject('hong');

// 2. hong 주소 가져오기
let hong = objct.getObject('hong');

// name, age, address 가져오기
objct.setValue(hong, 'name', '홍길동')
objct.setValue(hong, 'age', 32)
objct.setValue(hong, 'address', '서울 성동구')

// name, age, address 가져오기
console.log(objct.getValue(hong, 'name'));
console.log(objct.getValue(hong, 'age'));
console.log(objct.getValue(hong, 'address'));

// address > 부산시
objct.updateValue(hong, 'address', '부산시')
console.log(objct.getValue(hong, 'address'));

// hong 주소 삭제
objct.deleteValue(hong, 'address')

// hong 객체 삭제
objct.deleteValue(hong)

console.log(addressBook);
