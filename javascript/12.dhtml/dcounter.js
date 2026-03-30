/*
    DOM 객체를 생성하기 전 호출되는 함수
*/
window.addEventListener('DOMContentLoaded', function() {
    // this.alert('content load clear!!')
    initForm()
})

function initForm() {
    //  <button type="button" onclick="counter('+')">increment(+)</button>
    //  <button type="button" onclick="counter('-')">decrement(-)</button>
    let output = `
    <div>
        <h2 id="number">0</h2>
        
        <button type="button" class='button' data-operation='increment'>increment(+)</button>
        <button type="button" class='button' data-operation='decrement'>decrement(-)</button>
    </div>
    `

    // DHTML에서는 화면을 구성한 후 반드시 이벤트 처리를 해야함!!!!!!
    document.querySelector('#content').innerHTML = output

    let buttons = document.querySelectorAll('.button')

    buttons.forEach((button) => {
        // 함수의 파라미터 : 콜백 함수(() => {}, function() {})
        button.addEventListener('click', () => {
            let number = document.querySelector('#number').textContent
            let type = button.dataset.operation;
            if(type === 'increment') {
            if(number >= 0) {
                document.querySelector('#number').textContent = ++number
            }
            } else  {
            if(number > 0) {
            document.querySelector('#number').textContent = --number
            } 
            }
        })
    })

    }
    //Button Event

const counter = (type) => {
        let number = document.querySelector('#number').textContent;

        if(type === '+') {
            if(number >= 0) {
                document.querySelector('#number').textContent = ++number
            }
    } else  {
            if(number > 0) {
            document.querySelector('#number').textContent = --number
        } 
    }
}