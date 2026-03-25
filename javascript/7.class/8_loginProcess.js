/**
 * 로그인 처리
 */
class User {
    #id
    #pwd

    constructor(id, pwd) {
        this.#id = id;
        this.#pwd = pwd;
    }

    getId = () => this.#id;
    getPwd = () => this.#pwd;
    setId = () => this.#id = id;
    setPwd = () => this.#pwd = pwd;
}

function loginCheck() {
    //id, pwd 값 가져오기
    let id = document.querySelector(`#id`).value;
    let password = document.querySelector(`#pwd`).value;
    // console.log(id, pwd);

    //유효성 체크 - 데이터 유, 무 체크
    if(id === '') {
        console.log('아이디를 입력해주세요');
        document.querySelector('#id').focus()
    } else if(password === '') {
        console.log('비밀번호를 입력해주세요');
        document.querySelector('#pwd').focus()
    } else {
        // // User Class
        let user = new User(id, password);
        let userObj = {id, password} // id:'test' password:'1234'
        console.log(user);
        console.log(userObj);

        // 서버에 user 전송~
        //비교 => did = test, dpass = 1234
        if(user.getId() === 'test' && user.getPwd() === '1234') {
            alert('로그인 성공!')
        }   else {
        alert('로그인 실패ㅜㅜ 뭔가 이상함 😤')
        }

    }

    

}