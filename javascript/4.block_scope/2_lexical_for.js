let j = 200;
// 1~5까지 출력
for (let i = 1; i < 6; i++) {
    console.log(i, j);
    //오류 발생: j가 있는 장소는 지역 변수로 지정된 곳에만 있기 때문이다.
    //오류 해결: j를 전역 변수가 있는 곳에 정의한다.
    //지역 변수는 그 블럭이 끝나는 지점에서 메모리에서 삭제된다.

    for (let j = 1; j < 6; j++) {
    console.log(i);
    }
}

let fluaits = ['🍏','🥭','🍋','🍊']
for (let i = 0; i < fluaits.length; i++) {
    console.log(fluaits[i]);
    
}