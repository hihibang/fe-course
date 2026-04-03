// DOM 객체를 생성 후 swiper 실행

//allow 함수는 함수 실행 전보다 무조건 먼저 실행
// 기본 함수는 상관 ❌
function creatSwiper() {
    const swiper = new Swiper('.swiper', {
    // Optional parameters
    direction: 'horizontal',
    autoplay: {delay:3000},
    loop: true,

    // If we need pagination
    pagination: {
    el: '.swiper-pagination',
    },

        // Navigation arrows
    navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
    },

    // And if we need scrollbar
    scrollbar: {
    el: '.swiper-scrollbar',
    },
    });
}

window.addEventListener('DOMContentLoaded', () => {
    creatSwiper()
})
