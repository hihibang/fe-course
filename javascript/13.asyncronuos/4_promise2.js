// async-await 쌍으로 존재해야 함
// 비동기식 로직의 순차적인 순서를 보장하는 키워드

console.clear()

async function promiseTest() {
    let dataArray = null;

    let promise1 = new Promise((resolve, reject)=>{
        let numbers = [1,2,3,4,5]
        resolve(numbers)
    })

    await promise1
        .then(result=> dataArray = result)
        .catch((error)=>{
            console.log(error);
        })
    console.log('dataArray =', dataArray);
}

promiseTest()