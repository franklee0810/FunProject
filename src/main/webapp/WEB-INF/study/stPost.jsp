<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SGETHER | (스터디 리더 네임)님의 STUDY POST</title>
    <link rel="stylesheet" href="<%=contextPath %>/resources/backup/main.css">
    <link rel="stylesheet" href="<%=contextPath %>/resources/backup/study-post.css">
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
            <p><strong>${sessionScope.loginfo.nickname}님 환영합니다 :)</strong></p>
            <div class="user-name-bar"></div>
        </div>

        <div class="user-interface-menu">
            <ul>
                <li><a href="#">회원정보 수정</a></li>
                <li><a href="#">스크랩 목록</a></li>
                <li><a href="#">메뉴2</a></li>
                <li><a href="#">메뉴3</a></li>
            </ul>
        </div>
    </div>

    <!-- Header -->
    <header>
        <div class="header">
            <div class="header-logo-title">
                <a href="<%=contextPath%>/main.co"><h1>SGETHER</h1></a>
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

    <!-- Study Post -->
    <section>
        <aside>
            <div class="study-menu">
                <div class="menu-toggle">
                    <button class="member-menu-btn menu-btn">스터디 멤버&nbsp;&nbsp;&nbsp;▾</button>
                </div>

                <div class="menu-content member-content">
                    <div class="study-member-list">
                    	<c:forEach var = "nick" items="${hostname }">
	                        <img src="./../images/user-default.png" class="user-profile-img">
	                        <span class="leader">스터디 리더&nbsp;&nbsp;:&nbsp;&nbsp;${nick.nickname }</span>
                        </c:forEach>
                    </div>
					<c:forEach var = "nick" items="${nickname }">
                    <div class="study-member-list">
                        <img src="./../images/user-default.png">
                        <span>${nick.nickname}</span>
                    </div>
					</c:forEach>
					
                    <!-- <div class="study-member-list">
                        <img src="./../images/user-default.png">
                        <span>스터디멤버 3</span>
                    </div>
					 -->
                </div>

                <!-- 스터디 관리 메뉴는 스터디 리더로 로그인 했을 경우에만 표시-->
                <div class="menu-toggle">
                    <button class="menu-btn manage-menu-btn">스터디 관리&nbsp;&nbsp;&nbsp;▾</button>
                </div>

                <div class="menu-content manage-content">
                    <div class="study-manage">
                        <p>대기 중 멤버</p>
						<c:forEach var = "sub" items="${subscription }">
                        <div class="wating-member-list">
                            <img src="./../images/user-default.png" class="user-profile-img">
    
                            <span>${sub.nickname }</span>&nbsp;&nbsp;&nbsp;
                
                            <button class="member-approve-btn">
                            	<a href="<%=contextPath %>/permission.st?mid=${sub.mid }&seq_study=${seq_study}">
                           			승인
                            	</a>
                            </button>
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
	                <c:forEach var = "filelist" items = "${filelist }" varStatus="check">
	                	<input type= "hidden" value = "${filelist.seq_file }" name = "seq_file">
	                    <div class="study-file-list">
	                        <span>
	                            <i class="xi-file-add sharefile-list"></i>
	                            <a href="<%=contextPath%>/download.st?seq_file=${filelist.seq_file }">
	                            	파일명&nbsp;&nbsp;:&nbsp;&nbsp;${filelist.file1 }
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
                    <form action="<%=contextPath%>/post.st" method="POST" enctype="multipart/form-data">

                        <div class="post-user-img">
                            <img src="./../images/user-default.png" class="user-profile-img">
                        </div>
    
                            <i class="xi-file-add-o file-upload-btn"></i>
                            <input type="file" name = "file1">
                            <br>
    
                            <span class="fileupload-intro">첨부 파일을 선택 하세요</span>
                            
                            <textarea name="content" class="cwWrite"></textarea><br>
                            <button type="submit" class="write-submit-btn">
                                등록
                            </button>
                            <input id = "seq_study" type = "hidden" name = "seq_study" value = "${seq_study }"><br>
							<input id = "mid" type = "hidden" name = "mid" value = "${mid }">
                    </form>
                </div>
                
				
                <div class="post-list">
                    <!-- 스터디그룹 생성 유저가 글을 남길 경우 아래 div로 출력 (색상 변환)-->
                    <c:forEach var = "host" items="${leader }">
                    <div class="post-list-item leader-write" style="user-select: none;">
                        <img src="./../images/user-default.png" class="user-profile-img">
						<input type = "hidden" id = "hostseq_post" value = "${host.seq_post}" name = "seq_post">
						<input type = "hidden" id = "hostwriter" value = "${host.mid }" name = "mid">
						<input type = "hidden" id = "hostcontent" value = "${host.content }" name= "cotent">
						
                        <span class="writer">${host.nickname }(${host.mid })</span>

                        <span class="write-date">${host.inputdate }</span>

                        <i class="xi-eraser post-modify-btn"></i>
                        <i class="xi-close-min post-delete-btn" onclick="deleteHostPost()"></i>
                        <!-- onClick post Num 매개변수 -->
                        <br>

                        <textarea class="comment-content" readonly>${host.content}</textarea><br>

                        <div class="post-modify-group">
                                <textarea class="comment-modify" onkeydown="commentsLength()" id = "newhostcontent"></textarea><br>

                                <button type="button" class="post-modify-submit" onclick="modifyHostPost()">수정</button>
                        </div>

                        <span class="post-filedown">
                            <i class="xi-folder-download post-filedown-btn"></i>첨부파일 : ${host.file1 }
                        </span>
                    </div>
                    </c:forEach>
                    
                    <c:forEach var = "bean" items="${post }">
						<div class="post-list-item" style="user-select: none;">
							<input type = "hidden" id = "seq_post" value = "${bean.seq_post }" name = "seq_post">
							<input type = "hidden" id = "writer" value = "${bean.mid }" name = "mid">
							<input type = "hidden" id = "content" value = "${bean.content }" name= "cotent">
	                        <img src="./../images/user-default.png" class="user-profile-img">
	
	                        <span class="writer">${bean.nickname }(${bean.mid })</span>
	
	                        <span class="write-date">${bean.inputdate }</span>
	
	                        <i class="xi-eraser post-modify-btn"></i>
	                        <i class="xi-close-min post-delete-btn" onclick="deletePost()"></i>
	                        <!-- onClick post Num 매개변수 -->
	                        <br>
	
	                        <textarea class="comment-content" readonly style="">${bean.content }</textarea><br>
	
	                        <div class="post-modify-group">
	                                <textarea class="comment-modify" onkeydown="commentsLength()" id = "newcontent"></textarea><br>
	
	                                <button type="button" class="post-modify-submit"  onclick="modifyPost()" >수정</button>
	                        </div>
							 
			                        <span class="post-filedown">
			                            <i class="xi-folder-download post-filedown-btn"></i>
			                            	첨부파일 : ${bean.file1 }
			                        </span>
		                       
	                    </div>
	                    
                    </c:forEach>
                    
                <div class="padding-div"></div>
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
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="<%=contextPath %>/resources/backup/main.js"></script>
    <script src="<%=contextPath %>/resources/backup/study-post.js"></script>
</body>
<script type="text/javascript">
/* $(document).ready(function(){
	
	
 	for (let i = 0; i < $('.check').length; i++) {
 		console.log(i);
	 if($('#beanpost').val() == $('#filepost').val()){
		 $('#check').val(0);
		 $('#write').html($('#filename').val());
	 }else{
		 $('#check').val(1);
	 }
	} 
}); */
</script>
</html>
