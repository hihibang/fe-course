let key = `37fd0902a2dde8d7c921c9e7bb5f8e7d`
let targetDt = '20260101'
const data_url = `http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=${key}&targetDt=${targetDt}`

window.addEventListener('DOMContentLoaded', ()=> {
    show();
})

const getJson = async() => {
    let reponse = await fetch(data_url)
    return reponse.json()
}

const show = async () => {
    //1. JSON 데이터 가져오기
    let kobis = await getJson()
    console.log(kobis);

    //2. 출력 데이터 생성: DHTML
    let output = `
        <h1>${kobis.boxOfficeResult.boxofficeType}</h1>
        <h3>일자: ${kobis.boxOfficeResult.showRange}</h3>
        <table border=1>
            <tr>
                <th>순위</th>
                <th>영화제목</th>
                <th>개봉일</th>
                <th>당일관객수</th>
                <th>누적관객수</th>
                <th>누적매출액</th>
            </tr>
            ${
                kobis.boxOfficeResult.dailyBoxOfficeList.map((kobi) => 
                `<tr>
                    <td>${kobi.rank}</td>
                    <td>${kobi.movieNm}</td>
                    <td>${kobi.openDt}</td>
                    <td>${kobi.audiCnt}</td>
                    <td>${kobi.audiAcc}</td>
                    <td>${kobi.salesAcc}</td>
                </tr>`
                ).join("")
            }
        </table>
    `
    //3. 출력
    document.querySelector('#content').innerHTML = output
}

