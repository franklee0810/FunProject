<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SGETHER | 스크랩 목록</title>
    <link rel="stylesheet" href="<%=contextPath %>/resources/backup/main.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/backup/study-scrap.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
    <!-- User Alram & Interface Group -->
    <div class="join-study-list">
        <span><a href="#">Join Study List</a></span>
        <span><a href="#">Join Study List</a></span>
        <span><a href="#">Join Study List</a></span>
    </div>

    <div class="user-alram">
        Alram :)
    </div>

    <div class="user-interface">
        <div class="user-image">
            <img src="" alt="">
        </div>

        <div class="user-name">
            <p><strong>OOO님 환영합니다 :)</strong></p>
            <div class="user-name-bar"></div>
        </div>

        <div class="user-interface-menu">
            <ul>
                <li><a href="#">회원정보 수정</a></li>
                <li><a href="#">스크랩 목록</a></li>
            </ul>
        </div>
    </div>

    <!-- Header -->
    <header>
        <div class="header">
            <div class="header-logo-title">
                <a href="#"><h1>SGETHER</h1></a>
            </div>

            <div class="header-menu">
                <ul>
                    <li><a href="#">스터디 찾기</a></li>
                    <li><a href="#" class="join-study-btn">가입 중 스터디</a></li>
                    <li><a href="#" class="login-btn">로그인</a></li>
                    <!-- <li><a href="#">회원가입</a></li> -->
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

    <!-- Study Scrap -->
    <section>
        <div class="scrap-wrapper">
            <h1><span class="scrap-icon">🔖</span> 스크랩 목록</h1>
           <div class="scrap-list">
          	 <c:forEach var = "wish" items="${wishlists}">
          	 	<input type = "hidden" id = "wishseq_study" value = "${wish.seq_study}" name = "seq_study">
          	 	<input type = "hidden" id = "wishmid" value = "${wish.mid }" name = "mid">
	                <div class="scrap-list-item">
	                    <div class="scrap-list-image">
	                        <img src="/uploadFile/study/${wish.image}" alt="scrap-image">
	                    </div>
	
	                    <div class="scrap-list-subinfo">
	                        <span class="scrap-study-subject"><a href="#">${wish.subject}</a></span>
	
	                        <span class="scrap-study-time">시간&nbsp;&nbsp;:&nbsp;&nbsp;${wish.time_from} ~ ${wish.time_to} </span>
	
	                        <span class="scrap-study-person">${wish.personnel}&nbsp;&nbsp;명 </span>
	
	                        <button class="study-region">${wish.city}</button>
	                        <button class="study-region">${wish.borough}</button>
	                    </div>
	
	                    <div class="scrap-list-delete">
	                       <a href = "<%=contextPath%>/deletewish.wi?seq_study=${wish.seq_study}&mid=${wish.mid}"> <i class="xi-close-min" ></i></a> 
	                      <!--   <script type="text/javascript">
								function deleteWishList(seq_study) {
									var seq_study = 0;
									var studyNo = $('#wishseq_study').val();
									seq_study = parseInt(studyNo);
									
									var mid = $('#wishmid').val();
									
									let confirmMsg = confirm('정말 포스트를 삭제 하시겠습니까?'+seq_study);
							
								    if (confirmMsg == true) {
								    	alert('여기까지 오냐?');
								    	location.href = 'deletewish.wi?seq_study='+seq_study+'&mid='+mid;
								    	
								    } else {
								    	location.reload();
								        return false;
								    }
								}
						</script> -->
	                    </div>
	                </div><br><br><br>
				</c:forEach>
                <!-- <div class="scrap-list-item">
                    <div class="scrap-list-image">
                        <img src="./../images/signup.png" alt="scrap-image">
                    </div>

                    <div class="scrap-list-subinfo">
                        <span class="scrap-study-subject"><a href="#">스터디 제목</a></span>

                        <span class="scrap-study-time">시간 : </span>

                        <span class="scrap-study-person">참가인원 : 10명 </span>

                        <button class="study-region">서울</button>
                        <button class="study-region">영등포</button>
                    </div>

                    <div class="scrap-list-delete">
                        <i class="xi-close-min"></i> 
                    </div>

                </div><br><br><br>

                <div class="scrap-list-item">
                    <div class="scrap-list-image">
                        <img src="./../images/signup.png" alt="scrap-image">
                    </div>

                    <div class="scrap-list-subinfo">
                        <span class="scrap-study-subject"><a href="#">스터디 제목</a></span>

                        <span class="scrap-study-time">시간 : </span>

                        <span class="scrap-study-person">참가인원 : 10명 </span>

                        <button class="study-region">서울</button>
                        <button class="study-region">영등포</button>
                    </div>

                    <div class="scrap-list-delete">
                        <i class="xi-close-min"></i> 
                    </div>

                </div><br><br><br>

                <div class="scrap-list-item">
                    <div class="scrap-list-image">
                        <img src="./../images/signup.png" alt="scrap-image">
                    </div>

                    <div class="scrap-list-subinfo">
                        <span class="scrap-study-subject"><a href="#">스터디 제목</a></span>

                        <span class="scrap-study-time">시간 : </span>

                        <span class="scrap-study-person">참가인원 : 10명 </span>

                        <button class="study-region">서울</button>
                        <button class="study-region">영등포</button>
                    </div>

                    <div class="scrap-list-delete">
                        <i class="xi-close-min"></i> 
                    </div>

                </div><br><br><br>

                <div class="scrap-list-item">
                    <div class="scrap-list-image">
                        <img src="./../images/signup.png" alt="scrap-image">
                    </div>

                    <div class="scrap-list-subinfo">
                        <span class="scrap-study-subject"><a href="#">스터디 제목</a></span>

                        <span class="scrap-study-time">시간 : </span>

                        <span class="scrap-study-person">참가인원 : 10명 </span>

                        <button class="study-region">서울</button>
                        <button class="study-region">영등포</button>
                    </div>

                    <div class="scrap-list-delete">
                        <i class="xi-close-min"></i> 
                    </div>

                </div><br><br><br> -->

                <div class="padding-div"></div>
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
            <input type="text" placeholder="ID"><br>
            <input type="password" placeholder="PASSWORD"><br>
            <span><a href="#">ID 찾기</a></span>
            <span>&nbsp;|&nbsp;</span>
            <span><a href="#">비밀번호 찾기</a></span><br>
            <button><a href="#">로그인</a></button>
            <a href="#"><button class="google-login-btn"></button></a><br><br>
            <span>🥳 아직 회원이 아니신가요? <a href="#" class="span-underline">가입하기</a></span>
        <div>
    </div>

    <script src="<%=contextPath %>/resources/backup/main.js"></script>
    
</body>
</html>

