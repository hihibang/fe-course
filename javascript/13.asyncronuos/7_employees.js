// 최초 호출되는 이벤트 함수
window.addEventListener('DOMContentLoaded', ()=>{
    show()
})

//getJson 함수 생성
const data_url = 'http://127.0.0.1:5500/javascript/13.asyncronuos/employees.json';
const getJson = async () => {
    let response = await fetch(data_url)
    return response.json()
}

//show 함수 생성
const show = async () => {
    let jsonData = await getJson() //panding: 나는 프로미스 타입이고 지금 Web API에서 너를 기다리고 있는 중이야
    console.log(jsonData);

    let output = `
        <h1>${jsonData.title}</h1>
        <table border=1>
            <tr>
                <th>NO</th>
                <th>NAME</th>
                <th>AGE</th>
                <th>DEPARTMENT</th>
            </tr>
            ${
                jsonData.list.map((company, index) =>
                    `<tr>
                        <td>${index+1}</td>
                        <td>${company.name}</td>
                        <td>${company.age}</td>
                        <td>${company.department}</td>
                    </tr>`
                ).join("")
            }
        </table?
    `
    document.querySelector('#content').innerHTML = output
}

show()