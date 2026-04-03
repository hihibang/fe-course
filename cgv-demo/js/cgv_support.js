window.addEventListener('DOMContentLoaded', () => {
    let search_content = document.querySelector('#search_content')
    let btnSearch = document.querySelector('#btnSearch')

    btnSearch.addEventListener('click', () => {
        if(search_content.value.trim() === '') {
            alert('내용 입력')
            search_content.focus()
        }
    })
    
    show()
})

//getJson 함수 생성;
const getJson = async () => {
    let response = await fetch('../data/support.json')
    return response.json()
}

//show 함수 생성
const show = async () => {
    let jsonData = await getJson() //panding: 나는 프로미스 타입이고 지금 Web API에서 너를 기다리고 있는 중이야
    console.log(jsonData);

    let output = `
        <table border=1>
        <thead>
            <tr>
                <th>번호</th>
                <th>구분</th>
                <th>타이틀</th>
                <th>생성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            ${
                jsonData.map((support, index) =>
                    `<tr>
                        <td>${index +1}</td>
                        <td>${support.type}</td>
                        <td>${support.title}</td>
                        <td>${support.rdate}</td>
                        <td>${support.hits}</td>
                    </tr>`
                ).join("") //문자열로 만들기
            }
        </tbody>
            <tfoot>
                <tr>
                    <td colspan="12344">1 2 3 4 5</td>
                </tr>
            </tfoot> 
        </table>
    `
    document.querySelector('#before-table').insertAdjacentHTML('afterEnd', output)
}