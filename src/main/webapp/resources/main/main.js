
/* Variable */ 
var loginBtn = document.querySelector('.login-btn');
var loginClose = document.querySelector('.login-close'); 
var showIogin = document.querySelector('.login-black-background');

var userBtn = document.querySelector('.main-user-btn'); 
var userInterface = document.querySelector('.user-interface'); 

var userAlramBtn = document.querySelector('.main-user-alram'); 
var userAlram = document.querySelector('.user-alram'); 

var joinStudyBtn = document.querySelector('.join-study-btn');
var joinStudyList = document.querySelector('.join-study-list');  

var slideBeforeBtn = document.querySelector('.slide-before-btn'); 
var slideNextBtn = document.querySelector('.slide-next-btn'); 
var hitItem1 = document.querySelectorAll('.study-hit-item');
var hitItem2 = document.querySelectorAll('.study-hit-item2');

var footer = document.querySelector('.footer'); 


/* Login */ 
if(loginBtn!=null){
    loginBtn.addEventListener('click', function() {
        showIogin.style.display = 'block';
    })
}

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

userInterface.addEventListener('mouseleave', function() {
    userInterface.style.display = 'none';
 })

 userAlramBtn.addEventListener('click', function() {
    userAlram.style.display = 'block';
})

userAlram.addEventListener('mouseleave', function() {
    userAlram.style.display = 'none';
 })

if(joinStudyBtn!=null){
    joinStudyBtn.addEventListener('mouseenter', function() {
        joinStudyList.style.display = 'block';
    })
}

joinStudyList.addEventListener('mouseleave', function() {
    joinStudyList.style.display = 'none';
 })


 /* Main Slider */

 var slideNext = document.querySelector('.slide-next-btn');
 var slidePrev = document.querySelector('.slide-prev-btn'); 
 var swiperWrapper = document.querySelector('.swiper-wrapper');
 var swiperc = document.querySelector('.swiper-container');


if(slideNext != null){
    slideNext.addEventListener('click', function() {
        swiperWrapper.style.marginLeft = '50px';
    })
}
if(slidePrev != null){
    slidePrev.addEventListener('click', function() {
        swiperWrapper.style.marginLeft = '8px';
    })
}

if(slideNext != null) {
    slideNext.addEventListener('click', function () {
        swiperWrapper.style.marginLeft = '50px';
    })
}
if(swiperc != null){
    var swiper = new Swiper(swiperc, {
        slidesPerView : 3,
        spaceBetween : 60,
        slidesPerGroup : 3,

        navigation : {
            nextEl : '.slide-next-btn', // 다음 버튼 클래스명
            prevEl : '.slide-prev-btn', // 이번 버튼 클래스명
        },

    });
}

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