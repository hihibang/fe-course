/**
 * KOBIS, KMDB API를 활용한 박스 오피스
*/

let kobis_key = `6206e4e96646c240ac59f09bc0164ff9`;
const kmdb_key = `59H5F0U0OFQB3R2261VM`;

/** KOBIS API - 박스오피스 가져오기 */
async function getKobis() {
    let date = new Date();
    let year = new String(date.getFullYear())
    let month = new String(date.getMonth()+1)
    let day = new String(date.getDate()-1)

    month = (month.length < 2)? '0'+month: month
    day = (day.length < 2)? '0'+day: day

    let today = year.concat(month).concat(day)
    console.log(today);
    
    
    let url = `http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice`;
    url += `/searchDailyBoxOfficeList.json?`;
    url += `key=${kobis_key}`;
    url += `&targetDt=${today}`;

    let response = await fetch(url);
    return response.json();
}

/** KMDB API - 포스터 가져오기 */
async function getPoster(movieNm, openDt) {
    openDt = openDt.split('-').reduce((acc, cur) => acc + cur);
    
    let url = `http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api`;
    url += `/search_json2.jsp?collection=kmdb_new2&detail=Y`;
    url += `&title=${movieNm}`;
    url += `&releaseDts=${openDt}&ServiceKey=${kmdb_key}`;

    let response = await fetch(url);
    let kmdb = await response.json();
    let posters = await kmdb?.Data?.[0]?.Result?.[0]?.posters?.split('|'); // ? Null인지 아닌지
    // console.log('result => ' ,posters[0]);

    return posters?.[0];
}

async function showList(list) {    
    let slist = list.slice(0, 5).map(async (movie) => {  
        let movieNm = movie.movieNm;
        let openDt = movie.openDt;  
        let audiAcc = movie.audiAcc;    
        let poster = await getPoster(movie.movieNm, movie.openDt);           
        // console.log(movie.movieNm, movie.openDt, poster); 
        return { movieNm, openDt, audiAcc, poster}            
    }); 

    return await Promise.all(slist);
}

async function createBoxoffice() {
    let kobis = await getKobis();
    let list = kobis.boxOfficeResult.dailyBoxOfficeList;
    let outputList = await showList(list);    
    // console.log('showList => ', outputList); 
    let output = `
        <ul>
            ${
                outputList.map((movie) => `
                    <li>
                        <div>
                            <img src="${movie.poster}" 
                                alt="moviechart img"
                                width="200px">
                        </div>
                        <div><h3>${movie.movieNm}</h3></div>
                        <div><h5>누적관객수 ${movie.audiAcc}</h5></div>
                    </li>
                `).join("")
            }
        </ul>
    `;  

    // console.log(output);
    document.querySelector('#boxoffice').innerHTML = output;    
}


window.addEventListener('DOMContentLoaded', () => {
        createBoxoffice();
});
