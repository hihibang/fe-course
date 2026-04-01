// 최초 호출되는 이벤트 함수
window.addEventListener('DOMContentLoaded', ()=>{
    show()
})

//1. JSON 데이터 가져오기
const data_url = 'http://127.0.0.1:5500/javascript/13.asyncronuos/employees.json';
const getJson = async () => {
    let response = await fetch(data_url)
    return response.json()
}

//HTML 파일 출력
const show = async () => {
    let jsonData = await getJson() // getJson()이 비동기 함수이기 때문에 아래에서 호출되기 위해서는 먼저 진행되어야 함. 그래서 await-async 키워드 사용
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
        </table>
    `
    document.querySelector('#content').innerHTML = output
}

show()