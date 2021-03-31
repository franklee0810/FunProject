<%--
  Created by IntelliJ IDEA.
  User: lomuh
  Date: 2021-03-05
  Time: 오후 7:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SGETHER | 나에게 딱 맞는 스터디 찾기</title>
    <link rel="stylesheet" href="<%=contextPath %>/resources/main/main.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.15/swiper-bundle.css">
</head>
<body>
    <!-- User Alram & Interface Group -->
    <div class="join-study-list">
        <c:forEach var = "studylist" items="${mystudylist}">
            <span><a href="<%=contextPath %>/post.st?seq_study=${studylist.seq_study}">스터디명 : ${studylist.subject}<br>참가 인원 : ${studylist.personnel}명</a></span>
        </c:forEach>
    </div>

    <c:if test="${whologin == 1}">
        <div class="user-alram">
            <c:forEach var="alram" items="${alrams}">
                    <span><a href="#">${alram.studyname} 에 ${alram.content}<br> ${alram.created_at}</a></span>
            </c:forEach>
        </div>
    </c:if>

    <div class="user-interface">
        <div class="user-image">
            <c:if test="${whologin == 0}">
                <img src="/uploadFile/user/user-default.png" alt="프로필 사진" class="profile-icon">
            </c:if>
            <c:if test="${ whologin != 0}">
                <img src="/uploadFile/user/${sessionScope.loginfo.profile}" alt="프로필 사진" class="profile-icon">
            </c:if>
        </div>

        <div class="user-name">
            <c:if test="${whologin == 0}">
                <p><strong>게스트님 환영합니다 :)</strong></p>
            </c:if>
            <c:if test="${ whologin != 0}">
                <p><strong>${sessionScope.loginfo.nickname}님 환영합니다 :)</strong></p>
            </c:if>
            <div class="user-name-bar"></div>
        </div>

        <div class="user-interface-menu">
            <c:if test="${whologin == 0}">
                <ul>
                    <li><a href="<%=contextPath%>/login.me">로그인</a></li>
                    <li><a href="<%=contextPath%>/registMember.me">회원가입</a></li>
                </ul>
            </c:if>
            <c:if test="${ whologin != 0}">
                <ul>
                    <li><a href="<%=contextPath%>/modify.me">회원정보 수정</a></li>
                    <li><a href="<%=contextPath%>/wish.wi">스크랩 목록</a></li>
                </ul>
            </c:if>
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
                    <li><a href="<%=contextPath%>/list.st">스터디 찾기</a></li>
                    <c:if test="${whologin eq 0}">
                        <li><a href="#" class="login-btn">로그인</a></li>
                        <li><a href="<%=contextPath%>/registMember.me">회원가입</a></li>
                    </c:if>
                    <c:if test="${whologin eq 1}">
                        <li><a href="#" id="wonsik" class="join-study-btn">가입 중 스터디</a></li>
                        <li><a href="<%=contextPath%>/logout.me">로그아웃</a></li>
                    </c:if>
                </ul>
            </div>

            <div class="header-search">
                <input type="text" id="keyword" name="keyword" placeholder="스터디 검색">
                <a href="#" onclick="Search();"><i class="xi-search"></i></a>
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

    <article>
        <div class="study-list-info">
            <h3>
                <span class="study-list-subtitle">HIT STUDY</span>
                <span class="study-list-title">가장 인기있는 스터디</span>

                <i class="xi-angle-left-min slide-prev-btn"></i>
                <i class="xi-angle-right-min slide-next-btn"></i>
            </h3>

            <div class="underline-bar"></div>
        </div>

        <div class="swiper-container">
            <div class="swiper-wrapper">
                <!--  평점 순으로 나열  -->
                <c:forEach var="beanByAvg_grade" items="${requestScope.listsByAvg_grade}" begin="0" end="10" step="1">
                    <div class="swiper-slide study-list-item">
                        <div class="study-list-image">
                            <img src="/uploadFile/study/${beanByAvg_grade.image}" width="250px" height="160px" style="object-fit:contain;">
                        </div>

                        <div class="study-list-text">
                            <span class="field">${beanByAvg_grade.topic}</span>
                            <i class="xi-star"></i>
                            <span class="grade">${beanByAvg_grade.avg_grade}</span><br>

                            <a href="<%=contextPath%>/detailview.st?seq_study=${beanByAvg_grade.seq_study}"><h3 class="study-title">${beanByAvg_grade.subject}</h3></a>

                            <div class="sub-info">
                                <span class="study-personnel">모집 가능 인원 : ${beanByAvg_grade.personnel}</span><br>
                                <span class="study-time">시간 : ${beanByAvg_grade.time_from} ~ ${beanByAvg_grade.time_to}</span><br>
                            </div>
                            <hr>

                            <div class="user-info">
                                <div class="user-profile">
                                    <img src="/uploadFile/user/${beanByAvg_grade.host.profile}" class="study-leader-image">
                                    <span class="study-leader-name">${beanByAvg_grade.host.nickname}</span>
                                </div>

                                <div class="study-region">
                                    <a href="#"><i class="xi-heart"></i></a>
                                    <button>${beanByAvg_grade.city}</button>
                                    <button>${beanByAvg_grade.borough}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </article>

    <article>
        <div class="study-list-info">
            <h3>
                <span class="study-list-subtitle">NOW</span>
                <span class="study-list-title">지금 모집 중인 스터디</span>
            </h3>

            <div class="underline-bar"></div>
        </div>

        <div class="study-list-content">
            <div class="study-list-group">
                <c:forEach var="bean" items="${requestScope.lists}">
                    <div class="study-list-item">
                        <div class="study-list-image">
                            <img src="/uploadFile/study/${bean.image}" width="250px" height="160px" style="object-fit:contain;">
                        </div>

                        <div class="study-list-text">
                            <span class="field">${bean.topic}</span>
                            <i class="xi-star"></i>
                            <!--  별점 관련해서  바인딩 해야함.  -->
                            <span class="grade">${bean.avg_grade}</span><br>

                            <a href="<%=contextPath%>/detailview.st?seq_study=${bean.seq_study}"><h3 class="study-title">${bean.subject}</h3></a>

                            <div class="sub-info">
                                <span class="study-personnel">모집 가능 인원 : ${bean.personnel}</span><br>
                                <span class="study-time">시간 : ${bean.time_from} - ${bean.time_to}</span><br>
                            </div>
                            <hr>

                            <div class="user-info">
                                <div class="user-profile">
                                    <img src="/uploadFile/user/${bean.host.profile}" class="study-leader-image">
                                    <span class="study-leader-name">${bean.host.nickname}</span>
                                </div>

                                <div class="study-region">
                                    <a href="#"><i class="xi-heart"></i></a>
                                    <button>${bean.city}</button>
                                    <button>${bean.borough}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </article>

    <div class="padding-div"></div>
</main>

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
        <form action="<%=contextPath%>/login.me" method="post">
            <input type="text" placeholder="ID" name="mid"><br>
            <input type="password" placeholder="PASSWORD" name="password"><br>
            <span><a href="#">ID 찾기</a></span>
            <span>&nbsp;|&nbsp;</span>
            <span><a href="#">비밀번호 찾기</a></span><br>
            <button type="submit">로그인</button>
            <a href="#"><button class="google-login-btn"></button></a><br><br>
        </form>
        <span>🥳 아직 회원이 아니신가요? <a href="<%=contextPath%>/registMember.me" class="span-underline">가입하기</a></span>
        <div>
        </div>

        <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script src="<%=contextPath %>/resources/main/main.js"></script>
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

            function Search() {
                if( $('#keyword').val() == '') {
                    alert("입력하세요");
                } else {
                    var url = `${pageContext.request.contextPath}/searchStudy.st`;
                    url = url + "?keyword="+$('#keyword').val();
                    var keyword = $('#keyword').val();
                    console.log(keyword);
                    location.href = url;
                    console.log(url);
                }
            }
        </script>
</body>
</html>