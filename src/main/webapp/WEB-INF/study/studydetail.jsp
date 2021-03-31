<%--
  Created by IntelliJ IDEA.
  User: lomuh
  Date: 2021-03-08
  Time: 오전 4:01
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
    <title>SGETHER | 여기는 스터디명 바인딩 해주세요 </title>
    <link rel="stylesheet" href="<%=contextPath %>/resources/main/main.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/study_detail/study-detail.css">
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

<!-- Study Detail -->
<section>
    <div class="study-detail-wrapper">
        <div class="study-detail-header">
            <div class="study-pr-image">
                <img src="/uploadFile/study/${study.image}">
            </div>

            <div class="study-user-summary">
                <span class="field">${study.topic}</span>
                <h1>
                    ${study.subject}
                    <a href="#"><i class="xi-heart like-btn"></i></a>
                </h1>
                <img src="/uploadFile/user/${host.profile}">
                <span class="study-user-name">${host.nickname}</span>
                <i class="xi-star"></i>
                <span class="grade">${study.avg_grade}</span>
                <button>${study.city}</button>
                <button>${study.borough}</button>

                <div class="study-info-summary">
                    <span>참가 가능 인원 : ${study.personnel}</span>
                    <span>시간 : ${study.time_from} - ${study.time_to}</span>
                </div>

                <div class="study-join-button">
                    <button><a href="<%=contextPath%>/my.st?seq_study=${study.seq_study}">참가하기</a></button><br>
                    <form action="<%=contextPath%>/wish.wi" method="post">
                        <button type="submit">스크랩하기</button>
                        <input type="hidden" name="seq_study" value="${seq_study}">
                        <input type="hidden" name="subject" value="${study.subject}">
                    </form>
                </div>
            </div>

            <div class="study-detail-menu">
                <div class="tab-list">
                    <ul>
                        <li class="tab-intro-btn content-active">소개</li>
                        <li class="tab-review-btn">리뷰</li>
                    </ul>
                </div>
            </div>

            <div class="study-detail-intro">
                <i class="xi-eraser intro-modify-btn"></i>

                <p class="study-detail-content">${study.intrd}</p>

                <form action="#" method="POST">
                    <div class="intro-modify-group">
                        <textarea></textarea><br>
                        <button type="submit">수정</button>
                    </div>
                </form>
            </div>

            <!-- 리뷰 -->
            <div class="study-detail-review">
                <br><br>
                <div class="review-write">
                    <c:if test="${whologin == 0}">
                        <img src="/uploadFile/user/user-default.png">

                        <div class="review-rating">

                            <span class="rating-intro">별점을 선택 하세요</span>

                            <select name="ratingScore" class="ratingScore" disabled>
                                <option>1.0</option>
                                <option>2.0</option>
                                <option selected>3.0</option>
                                <option>4.0</option>
                                <option>5.0</option>
                            </select>

                                <%-- form 태그 추가, button id, name, 추가, textarea name, id 추가   --%>
                            <textarea name="content" id="content" placeholder="리뷰 작성하세요" class="cwWrite" disabled></textarea>
                            <button type="button" id="btnReview" name="reviewInsertBtn" class="write-submit-btn" disabled>
                                등록
                            </button>
                        </div>
                    </c:if>
                    <c:if test="${whologin == 1}">
                        <img src="/uploadFile/user/${sessionScope.loginfo.profile}">

                        <div class="review-rating">
                            <span class="rating-intro">별점을 선택 하세요</span>
                            <form action="<%=contextPath%>/insertReview.st" method="post">

                                <select name="ratingScore" class="ratingScore">
                                    <option>1.0</option>
                                    <option>2.0</option>
                                    <option selected>3.0</option>
                                    <option>4.0</option>
                                    <option>5.0</option>
                                </select>

                                <textarea name="content" placeholder="리뷰 작성하세요" class="cwWrite"></textarea>
                                <button type="submit" name="reviewInsertBtn" class="write-submit-btn">
                                    등록
                                </button>
                                <input type="hidden" name="seq_study" value="${seq_study}">
                            </form>
                        </div>
                    </c:if>
                </div>

                <div class="review-list">

<%--                    <div class="review-list-item">--%>
<%--                        <img src="./../images/user-default.png">--%>

<%--                        <span class="writer">유저 닉네임 바인딩</span>--%>

<%--                        <i class="xi-star"></i>--%>
<%--                        <span class="rating">5.0</span>--%>

<%--                        <span class="write-date">2019-02-24 17:03:29</span>--%>

<%--                        <i class="xi-eraser review-modify-btn"></i>--%>
<%--                        <i class="xi-close-min review-delete-btn" onclick="deletePost()"></i>--%>

<%--                        <!-- onClick post Num 매개변수 -->--%>

<%--                        <br>--%>

<%--                        <textarea class="comment-content" readonly>코멘트 내용</textarea>--%>

<%--                        <div class="review-modify-group">--%>
<%--                            <form action="" method="POST">--%>
<%--                                <textarea class="comment-modify" onkeydown="commentsLength()"></textarea><br>--%>

<%--                                <button type="submit" class="review-modify-submit">수정</button>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                </div>
            </div>
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
        <span>🥳 아직 회원이 아니신가요? <a href="#" class="span-underline">가입하기</a></span>
        <div>
        </div>

        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="<%=contextPath %>/resources/study_detail/study-detail.js"></script>
        <script>
            $('[name=reviewInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시
                reviewInsert(); //Insert 함수호출(아래)
            });

            // 리스트
            function reviewList(){
                console.log('reviewList 호출 ');

                var url = `${pageContext.request.contextPath}/listReview.st`;
                console.log(url);

                var seq_study = `${study.seq_study}`;
                console.log("seq_study : " + seq_study);

                $.ajax({
                    url : url,
                    type : 'post',
                    contentType : 'application/json;charset=utf-8',
                    dataType: "json",
                    data : JSON.stringify({'seq_study':seq_study}),
                    accept: { json: 'application/json' },
                    headers: { "Content-Type": "application/json" },
                    success : function(data){
                        console.log(data);

                        var result ='';
                        for(var i in data) {
                            result += '<form action="${pageContext.request.contextPath}/deleteReview.st" method="post" id="review-' + data[i].seq_review + '">';
                            result += '<div class="review-list-item" id="seq_review'+data[i].seq_review+'">';
                            result += '<img src="/uploadFile/user/' + data[i].member.profile + '">';
                            result += '<span class="writer">'+ data[i].mid  +'</span>';
                            result += '<i class="xi-star"></i>';
                            result += '<span id="grade' + data[i].seq_review + '" class="rating">'+ data[i].grade +'</span>';
                            result += '<span id="inputdate' + data[i].seq_review + '" class="write-date">'+ data[i].inputdate +'</span>';
                            var mid = '${sessionScope.loginfo.mid}';
                            if(mid == data[i].mid){

                                // result += '<a href="#" onclick="reviewModify('+data[i].no + ',\''+data[i].content+'\');"><i class="xi-eraser review-modify-btn"></i></a>';
                                // result += '<a href="#" onclick="reviewDelete('+data[i].no + ');"><i class="xi-close-min review-delete-btn"></i></a>';
                                result += '<a href="#" onclick="reviewModify(' + data[i].seq_review + ');"><i class="xi-eraser review-modify-btn"></i></a>';
                                result += '<a href="#" onclick="reviewDelete('+data[i].seq_review + ');"><i class="xi-close-min review-delete-btn"></i></a>';
                                result += '<input type="hidden" name="seq_review" value="' + data[i].seq_review + '" >'
                                result += '<input type="hidden" name="seq_study" value="${seq_study}" >'
                            }

                            result += '<br>';
                            result += '<textarea id="content' + data[i].seq_review + '" class="comment-content" readonly>'+ data[i].content +'</textarea>';
                            result += '</div>';
                            result += '</form>';
                        }
                        $('.review-list').html(result);
                    },
                    error:function(request, status, error) {
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
            }

            // 수정
            function reviewModify(seq_review) {
                var modifyForm = '<form action="<%=contextPath%>/modifyReview.st" method="post">';
                modifyForm += '<img src="/uploadFile/user/${sessionScope.loginfo.profile}">';
                modifyForm += '<span class="writer">${sessionScope.loginfo.mid}</span>';
                modifyForm += '<i class="xi-star"></i>';
                modifyForm += '<span class="rating">'+ $('#grade'+seq_review).text() +'</span>';
                modifyForm += '<span class="write-date">'+ $('#inputdate'+seq_review).text() +'</span>';
                modifyForm += '<br>';
                modifyForm += '<textarea id="listReply-'+seq_review+'" class="comment-content" name="content">'+ $('#content'+seq_review).text() +'</textarea>';

                // 버튼 디자인 수정 필요
                modifyForm += '<button type="submit" id="btnReview" name="reviewInsertBtn" class="write-submit-btn">수정</button>';
                modifyForm += '<input type="hidden" name="seq_review" value="' + seq_review + '" >'
                modifyForm += '<input type="hidden" name="seq_study" value="${seq_study}" >'
                modifyForm += '<button onclick="reviewList()">취소</button>';
                modifyForm += '</form>'

                $('#seq_review'+seq_review).html(modifyForm);
            }

            //수정
            function reviewModifier(seq_review) {
                var seq_study = `${study.seq_study}`;

                // 수정 리뷰
                var modifiedContent = $('#listReply-'+seq_review).val();

                //url 확인
                var url4 = `${pageContext.request.contextPath}/modifyReview.st`;

                $.ajax({
                    url : url4,
                    contentType : 'application/json;charset=utf-8',
                    type : 'post',
                    data : JSON.stringify({'content' : modifiedContent, 'seq_review' : seq_review }),
                    success : function(data) {
                        if(data == "y" ) {
                            alert("댓글수정완료");
                            reviewList(seq_study);
                        }
                    }
                });
            }

            // 삭제
            function reviewDelete(seq_review) {
                var seq_study = `${study.seq_study}`;

                if(!confirm("리뷰를 삭제하실건가요? ")) {
                    return;
                }else {
                    $("#review-" + seq_review).submit();
                }
            }

            $(document).ready(function(){
                reviewList(); //페이지 로딩시 댓글 목록 출력
            });
        </script>
</body>
</html>