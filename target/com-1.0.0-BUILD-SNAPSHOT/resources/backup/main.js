
/* Variable */ 
var loginBtn = document.querySelector('.login-btn');
var loginClose = document.querySelector('.login-close'); 
var showIogin = document.querySelector('.login-black-background');


var userBtn = document.querySelector('.main-user-btn'); 
var userInterface = document.querySelector('.user-interface'); 

var userAlramBtn = document.querySelector('.main-user-alram'); 
var userAlram = document.querySelector('.user-alram'); 

var slideBeforeBtn = document.querySelector('.slide-before-btn'); 
var slideNextBtn = document.querySelector('.slide-next-btn'); 
var hitItem1 = document.querySelectorAll('.study-hit-item');
var hitItem2 = document.querySelectorAll('.study-hit-item2');

var footer = document.querySelector('.footer'); 





/* Login */ 

loginBtn.addEventListener('click', function() {
    showIogin.style.display = 'block';
})



loginClose.addEventListener('click', function() {
    showIogin.style.display = 'none';
})

showIogin.addEventListener('click', function(e) {
    if(e.target == e.currentTarget) { 
        showIogin.style.display = 'none';
    }
 })


 /* Modal Popup */
 userBtn.addEventListener('mouseenter', function() {
    userInterface.style.display = 'block';
})

userBtn.addEventListener('mouseleave', function() {
    userInterface.style.display = 'none';
})

userInterface.addEventListener('mouseleave', function() {
    userInterface.style.display = 'none';
 })

 userAlramBtn.addEventListener('click', function() {
    userAlram.style.display = 'block';
})

userAlram.addEventListener('mouseleave', function(e) {
    userAlram.style.display = 'none';
 })

 /* Main Slider */

var swiper = new Swiper('.swiper-container', {
    slidesPerView : 3,
    spaceBetween : 5,
    slidesPerGroup : 3,
    roundLengths: true,
    loopFillGroupWithBlank : true,

    loop : true, 

    navigation : {
        nextEl : '.slide-next-btn', // 다음 버튼 클래스명
        prevEl : '.slide-prev-btn', // 이번 버튼 클래스명
    },
});
 

 /* footer Event */
 window.addEventListener('scroll', ()=> {
    let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
	let windowHeight = window.innerHeight; // 스크린 창
    let fullHeight = document.body.scrollHeight; //  margin 값은 포함 되지 않음
    
    if (scrollLocation + windowHeight >= fullHeight) {
        footer.style.display = 'block';
	} else {
        footer.style.display = 'none';
    }
 })