/*
    DOM 객체 생성 후 객체별 이벤트 호출
*/
// 돔이 다 만들어진 나중에(HTML이 완성된 다음에 실행)
window.addEventListener('DOMContentLoaded', () => {
    let id = document.querySelector('#id');
    let pwd = document.querySelector('#pwd');
    let idMsg = document.querySelector('#idMsg');
    let pwdMsg = document.querySelector('#pwdMsg');
    let btnLogin = document.querySelector('#btnLogin');

    id.addEventListener('input', () => {
        if(id.value.trim() !== '') {
            idMsg.style.display = 'none';
        }
    });
    pwd.addEventListener('input', () => {
        if(pwd.value.trim() !== '') {
            pwdMsg.style.display = 'none';
        }
    });

    btnLogin.addEventListener('click', () => { //Click이라는 행동을 했을 때
        let isValid = true

        if(id.value.trim() === '') {
            idMsg.style.display = 'block'
            idMsg.style.fontSize = '12px'
            idMsg.style.color = 'red'
            idMsg.textContent = '아이디를 입력해주세요'
            id.focus()
            isValid = false
        } else if(pwd.value.trim() === '') {
            pwdMsg.style.display = 'block'
            pwdMsg.style.fontSize = '12px'
            pwdMsg.style.color = 'red'
            pwdMsg.textContent = '패스워드를 입력해주세요'
            pwd.focus()
            isValid = false
        } else {
            if(isValid) {
                console.log('서버 전송 ---->', id.value, pwd.value);
            }
        }
    })
});

/*
    loginCheck(): 로그인 유효성 확인

const loginCheck = () => {
    let id = document.querySelector('#id')
    let pwd = document.querySelector('#pwd')
    
    if(id.value === '') {
        alert('아이디를 입력해주세요')
        id.focus()
    } else if(pwd.value === '') {
        alert('패스워드를 입력해주세요')
        pwd.focus()
    } else {
        console.log('서버 전송');
    }
}
*/
