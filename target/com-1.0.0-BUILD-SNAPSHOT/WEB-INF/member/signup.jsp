<%--
  Created by IntelliJ IDEA.
  User: lomuh
  Date: 2021-03-07
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SGETHER | 회원가입</title>
    <link rel="stylesheet" href="<%=contextPath %>/resources/main/main.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/user_signup/user-signup.css">
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
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
                <li><a href="#">스크랩 목록</a></li>
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
                    <li><a href="<%=contextPath%>/logout.me.st">로그아웃</a></li>
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

<!-- User Sign-up Section -->
<section>
    <div class="wrapper">
        <form:form modelAttribute="member"  name="member" action="${path}/registMember.me" method="post" enctype="multipart/form-data">
            <div class="signup-image">
            </div>

            <div class="signup-item-group">
                <div class="signup-item">
                    <div class="signup-title">
                        <h1>회원가입</h1>
                    </div>

                    <div class="signup-profile">
                        <div class="profile-img">
                            <img src="<%=contextPath%>/resources/images/user-default.png" alt="user-image" class="user-image-preview" >
                        </div>

                        <div class="profile-upload">
                            <i class="xi-upload main-user-upload"></i>
                            <input type="file" class="uploadimage" name="uploadimage"><br>
                        </div>
                    </div>

                    <div class="signup-item">
                        <div class="signup-input">
                            <input type="text" name="mid" placeholder="아이디">
                            <span class="check-id-btn" id="idCheck">중복 확인</span>
                            <span class="error_id error"></span><br>
                        </div>
                    </div>

                    <div class="signup-item">
                        <div class="signup-input">
                            <input type="text" name="nickname" class="nickname" placeholder="닉네임">
                            <span class="check-nick-btn" id="nicknameCheck">중복 확인</span><br>
                            <span class="error error_nick"></span>
                        </div>
                    </div>

                    <div class="signup-item">
                        <div class="signup-input">
                            <input type="text" name="name" class="name" placeholder="이름">
                            <span class="error error_name"></span>
                        </div>
                    </div>

                    <div class="signup-item">
                        <div class="signup-input">
                            <input type="password" name="password" placeholder="비밀번호">
                            <span class="error error_password"></span>
                        </div>
                    </div>

                    <div class="signup-item">
                        <div class="signup-input">
                            <input type="password" name="password1" placeholder="비밀번호 확인">
                            <span class="error error_password1"></span>
                        </div>
                    </div>

                    <div class="signup-item">
                        <div class="signup-input">
                            <input type="email" name="email" placeholder="이메일">
                            <span class="error error_email"></span>
                        </div>
                    </div>

                    <div class="signup-item">
                        <div class="signup-input">
                            <input type="number" name="age" placeholder="나이">
                            <span class="error error_age"></span>
                        </div>
                    </div>

                    <div class="signup-item">
                        <div class="signup-input">
                            <select name="gender">
                                <option value="1">남성</option>
                                <option value="2">여성</option>
                            </select>
                            <span class="error error_gender"></span>
                        </div>
                    </div>

                    <div class="signup-button-group">
                        <button type="submit">회원가입</button>
                        <button type="reset">취소</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</section>

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

        <script src="<%=contextPath %>/resources/main/main.js"></script>
        <script src="<%=contextPath %>/resources/user_signup/user-signup.js"></script>
        <script>
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