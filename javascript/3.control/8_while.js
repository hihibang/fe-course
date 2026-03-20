/**
    while - 종료되는 조건을 알고 있는 경우
    while(조건식) {
        실행문;
        증가값;
    }
 */

//1~10까지 출력
let i = 1;
while(i < 11) {
    console.log(`지금 숫자는 ${i}입니다`);
    if (i==7) break;
    i ++
}

//메뉴 선택
//1:피자 2: 핫도그 3: 햄버거
let flag = true;
let menu = 1;
while (flag) {
    console.log("1:피자 2: 핫도그 3: 햄버거");
    if (menu == 1) {
        console.log('🍕');
        flag = false;
    } else if (menu == 2) {
        console.log('🌭');
        flag = false;
    } else if (menu == 3) {
        console.log('🍔');
        flag = false;
    } else {
        console.log('메뉴 준비중👩🏻‍🍳'); 
    }
}