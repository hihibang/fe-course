/*
    block 단위로 실행되는 lexical environment
*/

{
    let a = 10; //전역
    console.log(a);
    
    {
        let b = 20; //지역
        console.log(a, b);
        {
            let c = 30; //지역
            console.log(a, b, c);
        }
    }
}