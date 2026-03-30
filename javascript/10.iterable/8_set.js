/*
    Set : 다양한 데이터 추가
    - add() : 데이터 추가
    - has() : 데이터 체크
    - delete() : 데이터 삭제
    - 중복된 데이터는 자동 필터링 되어 하나만 저장
*/
console.clear()
let mySet = new Set()
mySet.add(100)
// mySet.add('100') 중복된 데이터는 자동 필터링 되어 하나만 저장
mySet.add('100')
mySet.add('홍길동')
mySet.add({'emoji':'🍏'})
mySet.add([1,2,3,4,5])
console.log(mySet);

//데이터 출력
for(value of mySet) {
    console.log(value);
}

// for(value of mySet) {
    //     if(mySet.has('홍길동')) {
        //         console.log(value);
        //     } else {
            //         console.log('길동이님은 밖에 나가셨음');
            //     }
            // }
if(mySet.has('홍길동')) {
    for(value of mySet) {
        if(value === '홍길동')
            console.log(value);
            
    }
}

console.clear()
if(mySet.has('홍길동')) {
    mySet.delete('홍길동')
}
console.log(mySet);

mySet.clear()
console.log(mySet);



