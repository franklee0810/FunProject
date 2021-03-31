<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SGETHER | 나에게 딱 맞는 스터디 찾기</title>

    <link rel="stylesheet" href="<%=contextPath %>/resources/main/main.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
</head>
<body>

    <!-- User Alram & Interface Group -->
    <div class="user-alram">
        Alram :)
    </div>

    <div class="user-interface">
        <div class="user-image">
            <img src="" alt="">
        </div>

        <div class="user-name">
            <p><strong>${sessionScope.loginfo.nickname}님 환영합니다 :)</strong></p>
            <div class="user-name-bar"></div>
        </div>

        <div class="user-interface-menu">
            <ul>
                <li><a href="#">회원정보 수정</a></li>
                <li><a href="#">메뉴1</a></li>
                <li><a href="#">메뉴2</a></li>
                <li><a href="#">메뉴3</a></li>
            </ul>
        </div>
    </div>

    <!-- Header -->
    <header>
        <div class="header">
            <div class="header-logo-title">
                <a href="<%=contextPath%>/main.co?mid=${sessionScope.loginfo.mid}"><h1>SGETHER</h1></a>
            </div>

            <div class="header-menu">
                <ul>
                    <li><a href="<%=contextPath%>/find.st">스터디 찾기</a></li>
                    <li><a id="wonsik" href="#">가입 중 스터디</a></li>
                    <li><a href="#" class="login-btn">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="wish.wi?mid=${sessionScope.loginfo.mid }">찜목록</a></li>
                </ul>
            </div>

            <div class="header-search">
                <input type="text" placeholder="스터디 검색">
                <a href="#"><i class="xi-search"></i></a>
                <i class="xi-bell-o main-user-alram"></i>
                <i class="xi-profile main-user-btn"></i>
            </div>

        </div>
    </header>

	<!-- mydropdown -->

	<c:if test="${whologin == 1}">

		<div id="profile_menu" style="position: absolute;
		    top: 60px;
		    left: 39.5%;
		    z-index: 100;
		    width: 240px;
		    background-color: #fff;
		    height: 200px;
		    border-radius: 0px 0px 5px 5px;
		    display: none; ">

		    <c:forEach var = "studylist" items="${mystudylist }">
			<div style="height:33px; border-bottom: 1px solid #dadada; width: 85%; margin: auto; cursor:pointer;">
				<div style="float:left;margin-top: 5px;margin-left: 5px;color: #06c;font-size: 0.9em;">
					<a href = "<%=contextPath %>/post.st?mid=${sessionScope.loginfo.mid}&seq_study=${studylist.seq_study}" style="">
						스터디명 : ${studylist.subject}&nbsp;&nbsp;참가 인원 : ${studylist.personnel}명
					</a>
				</div>
			</div>
			</c:forEach>
		</div>

	</c:if>
    <!-- Main-->
    <main>
        <section class="main-image">
            <div class="main-image-content">
                <h2>원하는 스터디를 검색해보세요!</h2>
                <p>분류별로 쉽고 정확하게, 강력한 관리 기능</p>
            </div>
        </section>

        <article class="study-list">
            <div class="study-hit-slide">
                <h3 class="study-list-title-group">
                    <span class="study-list-title-sm">HIT STUDY</span>
                    <span class="study-list-title">가장 인기있는 스터디</span>
                    <button class="slide-prev-btn">❮
                    </button>
                    <button class="slide-next-btn">❯
                    </button>
                </h3>

                <div class="swiper-container">
                    <div class="swiper-wrapper study-hit-list">
                        <div class="swiper-slide study-hit-item">
                            HIT 스터디 1
                        </div>

                        <div class="swiper-slide study-hit-item">
                            HIT 스터디 2
                        </div>

                        <div class="swiper-slide study-hit-item">
                            HIT 스터디 3
                        </div>
                    </div>
                </div>
            </div>

            <div class="study-list-content">
                <h3 class="study-list-title-group">
                    <span class="study-list-title-sm">DEV STUDY</span>
                    <span class="study-list-title">개발 관련 스터디</span>
                </h3>

                <div class="study-subject-list">
                    <div class="study-list-item">
                        스터디 1
                    </div>

                    <div class="study-list-item">
                        스터디 2
                    </div>

                    <div class="study-list-item">
                        스터디 3
                    </div>
                </div>
            </div>
        </article>
    </main>


	<c:if test="${whologin == 0}">
		<form action="<%=contextPath%>/login.me" method = "post"
				style = "margin-left: 44%;margin-top: 5%;">
			아이디<br>
			<input type = "text" name  = "mid"><br><br>
			비밀번호 <br>
			<input type = "text" name ="password"><br><br>
			<input type = "submit" value = "로그인">
		</form>
	</c:if>
    <!-- footer -->
    <footer>
        <div class="footer">
            <div class="footer-top">
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">서비스이용약관</a></li>
                    <li><a href="#">개인정보취급방침</a></li>
                </ul>
            </div>

            <div class="footer-bottom">
                <a href="tel:020200202">TEL : 02-020-0202 &nbsp;|&nbsp;</a>
                <a href="mailto:sgether@sgetherinfo.com">EMAIL : sgether@sgetherinfo.com</a>
            </div>

            <div class="footer-copyright">
                <p>©SGETHER. ALL RIGHTS RESERVED</p>
            </div>
        </div>
    </footer>

    <!-- Login Layer Popup -->
    <div class="login-black-background">
        <div class="login-white-background">
            <p class="login-close">×</p>
            <h3>LOGIN</h3>
            <input type="text" placeholder="ID"><br>
            <input type="password" placeholder="PASSWORD"><br>
            <span><a href="#">ID 찾기</a></span>
            <span>&nbsp;|&nbsp;</span>
            <span><a href="#">비밀번호 찾기</a></span><br>
            <button><a href="#">로그인</a></button>
            <a href="#"><button class="google-login-btn"></button></a>
        <div>
    </div>



    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="<%=contextPath %>/resources/main/main.js"></script>
</body>
<script type="text/javascript">
var slide_state = 0;

$('#wonsik').click(function(){
	//alert('dddddd');
	if(slide_state == 0){
		$('#profile_menu').slideDown(300);
		slide_state = 1;
	}
	else{
		$('#profile_menu').slideUp(300);
		slide_state = 0;
	}
});
</script>
</html>