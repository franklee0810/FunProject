// Signup Section 

// Variable
let form = document.member;

let errorId = document.querySelector('.error_id');
let errorNick = document.querySelector('.error_nick');
let idCheckBtn = document.querySelector('.check-id-btn');
let nickCheckBtn = document.querySelector('.check-nick-btn');
let errorName = document.querySelector('.error_name');
let errorPassword = document.querySelector('.error_password');
let errorPassword1 = document.querySelector('.error_password1');
let errorEmail = document.querySelector('.error_email');
let errorAge = document.querySelector('.error_age');
let errorGender = document.querySelector('.error_gender');

let userImageBtn = document.querySelector('.uploadimage');


// ID Check

if (form.mid.value == '') {
    form.mid.focus();
    errorId.innerHTML = '* ID를 입력 해주세요';
} 

form.mid.addEventListener('change', (e)=> {
    if (form.mid.value.length >= 4 && form.mid.value.length <= 10) {
        form.nickname.focus();
        errorId.innerHTML = '';
    } else {
        form.mid.focus();
        errorId.innerHTML = 'ID는 4글자 이상 10글자 이하 입력 해주세요';
        e.preventDefault;
    }
});

$('#idCheck').click(function () {
    $.ajax({
        url: '/midCheck.me?mid=' + form.mid.value,
        type : 'POST',
        success : function (data) {
            if(data == "N"){
                errorId.innerHTML = '* 사용중인 아이디입니다';
                $("#reg_submit").attr("disabled",true);
            }else {
                errorId.innerHTML = '* 사용 가능한 아이디입니다';
                $("#reg_submit").attr("disabled",false);
            }
        }, error : function () {
            errorId.innerHTML = '* 서버와의 알수없는 오류가 발생했습니다';
            $("#reg_submit").attr("disabled",false);
        }
    });
});

// Nickname Check

form.nickname.addEventListener('focus', (e)=> {
    if (form.nickname.value == '') {
        form.nickname.focus();
        errorNick.innerHTML = '* 닉네임을 입력 해주세요';
        e.preventDefault;
    } 
});

form.nickname.addEventListener('change', (e)=> {
    if (form.nickname.value.length >= 2 && form.nickname.value.length <= 8) {
        form.name.focus();
        errorNick.innerHTML = '';
    } else {
        form.nickname.focus();
        errorNick.innerHTML = '* 닉네임은 2글자 이상 8글자 이하 입력 해주세요';
        e.preventDefault;
    }
});

$('#nicknameCheck').click(function () {
    $.ajax({
        url: '/nicknameCheck.me?nickname=' + form.nickname.value,
        type : 'POST',
        success : function (data) {
            if(data == "N"){
                errorNick.innerHTML = '* 사용중인 닉네임입니다';
                $("#reg_submit").attr("disabled",true);
            }else {
                errorNick.innerHTML = '* 사용 가능한 닉네임입니다';
                $("#reg_submit").attr("disabled",false);
            }
        }, error : function () {
            errorNick.innerHTML = '* 서버와의 알수없는 오류가 발생했습니다';
            $("#reg_submit").attr("disabled",false);
        }
    });
});

// Name Check

form.name.addEventListener('focus', (e)=> {
    if (form.name.value == '') {
        form.name.focus();
        errorName.innerHTML = '* 이름을 입력 해주세요';
        e.preventDefault;
    } 
});

form.name.addEventListener('change', (e)=> {
    if (form.name.value.length >= 2 && form.name.value.length <= 8) {
        form.password.focus();
        errorName.innerHTML = '';
    } else {
        form.name.focus();
        errorName.innerHTML = '* 이름은 2글자 이상 8글자 이하 입력 해주세요';
        e.preventDefault;
    }
});

// Password Check

form.password.addEventListener('focus', (e)=> {
    if (form.password.value == '') {
        form.password.focus();
        errorPassword.innerHTML = '* 패스워드를 입력 해주세요';
        e.preventDefault;
    } 
});

form.password.addEventListener('change', (e)=> {
    if (form.password.value.length >= 6 && form.password.value.length <= 12) {
        form.password1.focus();
        errorPassword.innerHTML = '';
    } else {
        form.password.focus(e);
        errorPassword.innerHTML = '* 패스워드는 6자리 이상 12자리 이하로 입력 해주세요';
        e.preventDefault;
    }
});

// Password Recheck 

form.password1.addEventListener('focus', (e)=> {
    if (form.password1.value == '') {
        form.password1.focus();
        errorPassword1.innerHTML = '* 패스워드를 다시 입력 해주세요';
        e.preventDefault;
    }
});

form.password1.addEventListener('change', (e)=> {
    if (form.password.value == form.password1.value) {
        form.email.focus();
        errorPassword1.innerHTML = '';
    } else {
        form.password1.focus();
        errorPassword1.innerHTML = '* 패스워드가 일치하지 않습니다';
        e.preventDefault;
    }
});

// Email Check

form.email.addEventListener('focus', (e)=> {
    if (form.email.value == '') {
        form.email.focus();
        errorEmail.innerHTML = '* 이메일을 입력 해주세요';
        e.preventDefault;
    }
});

form.email.addEventListener('change', (e)=> {
    let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    if (form.email.value.match(regExp) != null) {
        form.age.focus();
        errorEmail.innerHTML = '';
    } else {
        form.email.focus();
        errorEmail.innerHTML = '* 이메일을 올바른 형식으로 입력 해주세요';
        e.preventDefault;
    }
});

// Age Check

form.age.addEventListener('focus', (e)=> {
    if (form.age.value == null) {
        form.age.focus();
        errorAge.innerHTML = '* 나이를 입력 해주세요';
        e.preventDefault;
    }
});

form.age.addEventListener('change', (e)=> {
    if (form.age.value >= 1) {
        form.gender.focus();
        errorAge.innerHTML = '';
    } else {
        form.age.focus();
        errorAge.innerHTML = '* 나이를 올바르게 설정 해주세요';
        e.preventDefault;
    }
});

// Gender Check 

form.gender.addEventListener('focus', ()=> {
    if (form.gender.value == null) {
        form.gender.focus();
        errorGender.innerHTML = '* 성별을 선택 해주세요';
        event.preventDefault;
    }
});


// User Profile 

userImageBtn.addEventListener('change', (event) => {
    const reader = new FileReader();

    reader.onload = function(event) { 
        
        let userImgPreview = document.querySelector('.user-image-preview');

        userImgPreview.src = event.target.result;
    }
        reader.readAsDataURL(userImageBtn.files[0]);
 });
