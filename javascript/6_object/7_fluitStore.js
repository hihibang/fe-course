import * as store from "../commons/objct.js";


let fstore = store.getObjects();

let apple = new store.Fruit('apple', '🍎');
let lemon = new store.Fruit('lemon', '🍋');

// store 게시
store.setObject('apple', apple)
store.setObject('lemon', lemon)

// store 삭제
store.deleteObject('apple');

console.clear()
console.log(fstore);
