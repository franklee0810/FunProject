<%--
  Created by IntelliJ IDEA.
  User: lomuh
  Date: 2021-03-07
  Time: 오후 6:06
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
    <title>SGETHER | ${hostMember.nickname}님의 STUDY POST</title>
    <link rel="stylesheet" href="<%=contextPath %>/resources/main/main.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/study_post/study-post.css">
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
<script>
    var seq_study = "${seq_study}";
</script>
<c:set var="postNum" value="0"/>
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

<!-- Study Post -->
<section>
    <aside>
        <div class="study-menu">
            <div class="menu-toggle">
                <button class="member-menu-btn menu-btn">스터디 멤버&nbsp;&nbsp;&nbsp;▾</button>
            </div>

            <div class="menu-content member-content">
                <div class="study-member-list">
                    <img src="/uploadFile/user/${hostMember.profile}" class="user-profile-img">
                    <span class="leader">리더 : ${hostMember.nickname}</span>
                </div>

                <c:forEach var="member" items="#{StudyMemberList}">
                    <div class="study-member-list">
                        <img src="/uploadFile/user/${member.profile}">
                        <span>${member.nickname}</span>
                    </div>
                </c:forEach>
            </div>

            <!-- 스터디 관리 메뉴는 스터디 리더로 로그인 했을 경우에만 표시-->
            <c:if test="${sessionScope.loginfo.mid eq hostMember.mid}">
                <div class="menu-toggle">
                    <button class="menu-btn manage-menu-btn">스터디 관리&nbsp;&nbsp;&nbsp;▾</button>
                </div>
            </c:if>

            <div class="menu-content manage-content">
                <div class="study-manage">
                    <p>대기 중 멤버</p>

                    <c:forEach var="member" items="#{subscription}">
                        <div class="wating-member-list">
                            <img src="/uploadFile/user/${member.profile}" class="user-profile-img">
                            <span>${member.nickname}</span>
                            <button class="member-approve-btn"><a href="<%=contextPath %>/permission.st?mid=${member.mid}&seq_study=${seq_study}">승인</a></button>
                        </div>
                    </c:forEach>

                    <div class="center-line"></div>
                    <p>스터디 관리</p>
                    <div class="study-manage-menu">
                        <button class="study-delete-btn">스터디 폐쇄</button>
                    </div>
                </div>
            </div>

            <div class="menu-toggle">
                <button class="menu-btn file-menu-btn">공유 파일 &nbsp;&nbsp;&nbsp;&nbsp;▾</button>
            </div>

            <div class="menu-content file-content">
                <c:forEach var="filelist" items="${filelist}" varStatus="check">
                    <input type="hidden" value="${filelist.seq_file}" name="seq_file">
                        <div class="study-file-list">
                            <span>
                                <i class="xi-file-add sharefile-list"></i>
	                            <a href="<%=contextPath%>/download.st?file=${filelist.file}">
	                            	파일명&nbsp;&nbsp;:&nbsp;&nbsp;${filelist.file}
	                            </a>
	                       </span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </aside>

    <div class="post-wrapper">
        <div class="study-post">
            <br><br>
            <div class="post-write">
                <form action="<%=contextPath%>/post.st" method="post" enctype="multipart/form-data">
                    <div class="post-user-img">
                        <img src="/uploadFile/user/${sessionScope.loginfo.profile}" class="user-profile-img">
                    </div>

                    <i class="xi-file-add-o file-upload-btn"></i>
                    <input type="file" name="file" multiple="multiple">
                    <br>

                    <span class="fileupload-intro">첨부 파일을 선택 하세요</span>

                    <textarea name="content" class="cwWrite"></textarea><br>
                    <button type="submit" class="write-submit-btn">
                        등록
                    </button>
                    <input id="seq_study" type="hidden" name="seq_study" value="${seq_study}">
                </form>
            </div>

            <div class="post-list">
                <!-- 스터디그룹 생성 유저가 글을 남길 경우 아래 div로 출력 (색상 변환)-->
                <c:forEach var="hostPost" items="${leaderPost}">
                    <div class="post-list-item leader-write">
                        <img src="/uploadFile/user/${hostMember.profile}" class="user-profile-img">
                        <span class="writer">${hostMember.nickname}(${hostMember.mid})</span>

                        <span class="write-date">${hostPost.inputdate}</span>

                        <c:if test="${hostMember.mid == sessionScope.loginfo.mid}">
                            <i class="xi-eraser post-modify-btn" onclick="modifyHostPost(${hostPost.seq_post})"></i>
                            <i class="xi-close-min post-delete-btn" onclick="deleteHostPost(${hostPost.seq_post})"></i>
                        </c:if>
                        <!-- onClick post Num 매개변수 -->
                        <br>

                        <textarea class="comment-content" id="comment-content-${hostPost.seq_post}" readonly>${hostPost.content}</textarea><br>

                        <div class="post-modify-group" id="post-modify-group-${hostPost.seq_post}">
                            <form action="<%=contextPath%>/updateHostPost.st" method="post">
                                <input type="hidden" value="${seq_study}" name="seq_study">
                                <input type="hidden" id="hostseq_post" value="${hostPost.seq_post}" name="seq_post">
                                <textarea class="comment-modify" onkeydown="commentsLength()" name="content" id="newhostcontent">${hostPost.content}</textarea><br>

                                <button type="submit" class="post-modify-submit">수정</button>
                            </form>
                        </div>

                        <span class="post-filedown">
                            <c:if test="${hostPost.fileList.size() != 0}">
                                <i class="xi-folder-download post-filedown-btn"></i>첨부파일 :
                                <c:forEach var="files" items="${hostPost.fileList}" varStatus="status">
                                    <c:if test="${status.first && !status.last}">
                                        <a href="<%=contextPath%>/download.st?file=${files.file}">${files.file}</a>&nbsp;,<br>
                                    </c:if>
                                    <c:if test="${status.first && status.last}">
                                        <a href="<%=contextPath%>/download.st?file=${files.file}">${files.file}</a>
                                    </c:if>
                                    <c:if test="${!status.first && status.last}">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=contextPath%>/download.st?file=${files.file}">${files.file}</a>
                                    </c:if>
                                    <c:if test="${!status.first && !status.last}">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=contextPath%>/download.st?file=${files.file}">${files.file}</a>&nbsp;,<br>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </span>
                    </div>
                </c:forEach>

                <c:forEach var="post" items="${postList}">
                    <div class="post-list-item">

                        <img src="/uploadFile/user/${post.writer.profile}" class="user-profile-img">

                        <span class="writer">${post.writer.nickname}(${post.writer.mid})</span>

                        <span class="write-date">${post.inputdate}</span>

                        <c:if test="${(post.writer.mid == sessionScope.loginfo.mid) or (hostMember.mid == sessionScope.loginfo.mid)}">
                            <i class="xi-eraser post-modify-btn"  onclick="modifyPost(${post.seq_post})"></i>
                            <i class="xi-close-min post-delete-btn" onclick="deletePost(${post.seq_post})"></i>
                        </c:if>
                        <!-- onClick post Num 매개변수 -->
                        <br>

                        <textarea class="comment-content" id="comment-content-${post.seq_post}" readonly>${post.content}</textarea><br>
                        <div class="post-modify-group" id="post-modify-group-${post.seq_post}">
                            <form action="<%=contextPath%>/updatePost.st" method="post">
                                <input type="hidden" value="${seq_study}" name="seq_study">
                                <input type = "hidden" id="seq_post" value="${post.seq_post}" name="seq_post">
                                <textarea class="comment-modify" onkeydown="commentsLength()" name="content" id="newcontent">${post.content}</textarea><br>

                                <button type="submit" class="post-modify-submit">수정</button>
                            </form>
                        </div>

                        <span class="post-filedown">
                            <c:if test="${post.fileList.size() != 0}">
                                <i class="xi-folder-download post-filedown-btn"></i>첨부파일 :
                                <c:forEach var="files" items="${post.fileList}" varStatus="status">
                                    <c:if test="${status.first && !status.last}">
                                        <a href="<%=contextPath%>/download.st?file=${files.file}">${files.file}</a>&nbsp;,<br>
                                    </c:if>
                                    <c:if test="${status.first && status.last}">
                                        <a href="<%=contextPath%>/download.st?file=${files.file}">${files.file}</a>
                                    </c:if>
                                    <c:if test="${!status.first && status.last}">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=contextPath%>/download.st?file=${files.file}">${files.file}</a>
                                    </c:if>
                                    <c:if test="${!status.first && !status.last}">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=contextPath%>/download.st?file=${files.file}">${files.file}</a>&nbsp;,<br>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </span>
                    </div>
                </c:forEach>

                <div class="padding-div"></div>
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
        <span>🥳 아직 회원이 아니신가요? <a href="<%=contextPath%>/registMember.me" class="span-underline">가입하기</a></span>
        <div>
        </div>

        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="<%=contextPath %>/resources/main/main.js"></script>
        <script src="<%=contextPath %>/resources/study_post/study-post.js"></script>
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