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

/* Login */
if(loginBtn != null) {
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

 /* Study Detail Variable */

let introTab = document.querySelector('.tab-intro-btn');
let reviewTab = document.querySelector('.tab-review-btn');
let introDetail = document.querySelector('.study-detail-intro');
let reviewDetail = document.querySelector('.study-detail-review');
let introModifyBtn = document.querySelector('.intro-modify-btn');
let introContent = document.querySelector('.study-detail-content');
let introContentModify = document.querySelector('.intro-modify-group');
let writeComments = document.querySelector('.cwWrite');
let ratingScore = document.querySelector('.ratingScore').value;

introTab.addEventListener('click', () => {
    reviewDetail.classList.remove('content-show');
    reviewTab.classList.remove('content-active');
    introTab.classList.add('content-active');
    introDetail.classList.remove('content-hide');
    introDetail.classList.add('content-show');
});

reviewTab.addEventListener('click', () => {
    introTab.classList.remove('content-active');
    reviewTab.classList.add('content-active');
    introDetail.classList.add('content-hide');
    reviewDetail.classList.add('content-show');
});

introModifyBtn.addEventListener('click', () => {
    if (introContentModify.style.display == 'none') {
        introContent.style.display = 'none';
        introContentModify.style.display = 'block';
    } else {
        introContentModify.style.display = 'none';
        introContent.style.display = 'block';
    }
    
});


// Review Modify 

for (let i = 0; i < $('.review-modify-btn').length; i++) {
	$('.review-modify-btn').eq(i).click(function() {

        if ($('.review-modify-group').eq(i).css("display") == 'none') {
             $('.comment-content').eq(i).hide()
             $('.review-modify-group').eq(i).show()

        } else {
            $('.comment-content').eq(i).show()
            $('.review-modify-group').eq(i).hide()
        }
	});
}

// Review Delete

let reviewDeleteBtn = document.querySelector('.review-delete-btn');

function deletePost(postNo) {
    let confirmMsg = confirm('정말 포스트를 삭제 하시겠습니까?');

    if (confirmMsg == true) {
       location.href = '';
    } else {
        return false;
    }
}


// Write Length

let modifyComments = document.querySelectorAll('.comment-modify');

function commentsLength() {

    for (let i = 0; i < modifyComments.length; i++ ) {
        // Post 200자 초과 안되게 자동 자르기
        let lengthCheckEx = /^.{200,}$/;

        if (lengthCheckEx.test(modifyComments[i].value)) {
            // 200자 초과시
            modifyComments[i].value = modifyComments[i].value.substr(0,200);
        }
    }
}

writeComments.addEventListener('keydown', () => {
    //리뷰 100자 초과 안되게 자동 자르기
    let lengthCheckEx = /^.{100,}$/;

    if (lengthCheckEx.test(writeComments.value)) {
        // 100자 초과시
        writeComments.value = writeComments.value.substr(0,100);
    }
});


var footer = document.querySelector('.footer'); 

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