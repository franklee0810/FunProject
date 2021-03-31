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

if(joinStudyBtn != null) {
    joinStudyBtn.addEventListener('mouseenter', function() {
        joinStudyList.style.display = 'block';
    })
}

if(joinStudyBtn != null) {
    joinStudyList.addEventListener('mouseleave', function() {
        joinStudyList.style.display = 'none';
    })
}

/* Study List */

let city = document.querySelector('.city');
let borough = document.querySelector('.borough');

city.addEventListener('change', () => {
    if (city.value == '서울') {
        var option1 = new Option("영등포", "city1", true)
        borough.options[1] = option1;
    }

    if (city.value == '경기') {
        borough.options[1] = null;
        var option1 = new Option("수원", "borough1", true)

        borough.options[1] = option1;
    }
});

/* Study Create */ 

let studyCreateBtn = document.querySelector('.study-create-btn');
let studyCreateToggle = document.querySelector('.study-black-background');
let studyCreateClose = document.querySelector('.login-close');

studyCreateBtn.addEventListener('click', function() {
    studyCreateToggle.style.display = 'block';
})

studyCreateClose.addEventListener('click', function() {
    studyCreateToggle.style.display = 'none';
})

studyCreateToggle.addEventListener('click', function(e) {
    if(e.target == e.currentTarget) { 
        studyCreateToggle.style.display = 'none';
    }
 })

 let studyImageBtn = document.querySelector('.upload-study-image');

 studyImageBtn.addEventListener('change', (event) => {
    const reader = new FileReader();

    reader.onload = function(event) { 
        
        let studyImgPreview = document.querySelector('.study-image-preview');

        studyImgPreview.src = event.target.result;
    }
        reader.readAsDataURL(studyImageBtn.files[0]);
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