function counter(type) {
    //input type: value, <tag>content</tag>: textContent
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