<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGETHER | 스터디 찾기</title>
    
    <link rel="stylesheet" href="<%=contextPath %>/resources/study_list/study-list.css">
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
   	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
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
    
    <!-- Study Create -->
    <div class="study-black-background">
        <div class="study-create">
            <p class="login-close">×</p>
            <h3>스터디 생성</h3>

			<c:set var="apppath" value="<%=request.getContextPath()%>" />
            <form action="${apppath}/create.st" method="POST" enctype="multipart/form-data">
  			
                <img src="/uploadFile/study/study.jpg" class="study-image-preview">
                <input type="file" class="upload-study-image" name="image"><br>

                <!-- [name] 추가. -->
                <select name="topic">
                <option selected>개발</option>
                <option>취미</option>
                <option>외국어</option>
                <option>자기계발</option>
                </select><br>

                <!--  name[studyname] 을 subject로 변경함.  -->
                <input type="text" name="subject" placeholder="스터디 이름"><br>

                <input type="number" name="personnel" placeholder="참가 인원"><br>

                <!--  name[time1]을 time_from으로 변경함. -->
                <input type="time" name="time_from">
                &nbsp; -  &nbsp;

                <!--  name[time2]을 time_to로 변경함. -->
                <input type="time" name="time_to"><br>

                <!--  name값 id값 추가 -->
                <select name="city" id="city" >
                </select>

                    &nbsp; -  &nbsp;
                <!--  name값 id값 추가 -->
                <select name="borough" id="borough">
                </select><br>

                <textarea name="intrd" placeholder="스터디 소개를 입력 해주세요"></textarea><br><br>
                <button type="submit">스터디 만들기</button>
            </form>
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

    
  <!-- Study List -->
  <!-- Study List -->
    <section>
            <div class="filter-group">
                <select name="city" class="city">
                </select>

                <select name="borough" class="borough"> 
                </select>

                <select name="field">
                    <option selected>분야</option>
                    <option>개발</option>
                    <option>취미</option>
                    <option>외국어</option>
                    <option>자기계발</option>
                </select>
				
				<button class="search-btn"><a href="#">검색</a></button>
                <button><a href="#" class="study-create-btn">스터디 만들기</a></button>
            </div> 
            
  			<div class="study-list-container">
                <div class="study-list-item-group">

                    <c:forEach var="bean" items="${requestScope.lists}">
                    <div class="study-list-item">
                        <div class="study-list-image">
                            <img src="/uploadFile/study/${bean.image}" width="250px" height="160px" style="object-fit:contain;">
                        </div>

                        <div class="study-list-text">
                            <span class="field">${bean.topic}</span>
                            <i class="xi-star"></i>
                            <span class="grade">${bean.avg_grade}</span><br>

                            <a href="<%=contextPath%>/detailview.st?seq_study=${bean.seq_study}"><h3 class="study-title">${bean.subject}</h3></a>

                            <div class="sub-info">
                                <span class="study-personnel">모집 가능 인원 : ${bean.personnel}  </span><br>
                                <span class="study-time">시간 : ${bean.time_from} ~  ${bean.time_to} </span><br>
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
</div>
</div>

 <!-- -------스크립트 영역 ------ -->
     <script src="<%=contextPath %>/resources/main/main.js"></script>
     <script src="<%=contextPath %>/resources/study_list/study-list.js"></script>
   
   
  <!--  지역 선택  -->
 <script>
 $('document').ready(function() {
 var area0 = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기도","강원도","충북","충남","전북","전남","경북","경남","제주도"];
  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
   var area3 = ["대덕구","동구","서구","유성구","중구"];
   var area4 = ["광산구","남구","동구",     "북구","서구"];
   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
   var area6 = ["남구","동구","북구","중구","울주군"];
   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

 

 // 시/도 선택 박스 초기화

 $("select[name^=city]").each(function() {
  $selcity = $(this);
  $.each(eval(area0), function() {
   $selcity.append("<option value='"+this+"'>"+this+"</option>");
  });
  $selcity.next().append("<option value=''>구/군 선택</option>");
 });

 

 // 시/도 선택시 구/군 설정

 $("select[name^=city]").change(function() {
  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
  var $borough = $(this).next(); // 선택영역 군구 객체
  $("option",$borough).remove(); // 구군 초기화

  if(area == "area0")
   $borough.append("<option value=''>구/군 선택</option>");
  else {
   $.each(eval(area), function() {
    $borough.append("<option value='"+this+"'>"+this+"</option>");
   });
  }
 });


});
    
    </script>
    
    	<script type="text/javascript">
  		
            $('.search-btn').click(function() {
                var city = $(".city option:selected").text();
                var borough = $(".borough option:selected").text();
                var topic = $("select[name=field]").val();

                var url = '${pageContext.request.contextPath}/searchStudyByArea.st';

                    $.ajax({
                    url : url,
                    type : 'post',
                    contentType : 'application/json; charset=utf-8',
                    dataType : "json",
                    data : JSON.stringify({
                            'city' : city,
                            'borough' : borough,
                            'topic' : topic
                            }),
                    accept: {json: 'application/json'},
                    headers: {"Content-Type": "application/json"},
                    success: function(data) {
                        if(data == null ) {
                            alert("검색 결과가 없습니다.");
/* 							var warning = '';
                            warning += '<h3>';
                            warning +='<span class="study-list-subtitle">'+city - borough - topic 결과 없음+'</span>';
                            warning +='<span class="study-list-title"></span>';
                            warning +='<i class="xi-angle-left-min slide-prev-btn"></i>';
                            warning +='<i class="xi-angle-right-min slide-next-btn"></i>';
                            warning +='</h3>';
                            $('.study-list-item-group').html(warning); */

                        } else {

                          var contextPath = `${pageContext.request.contextPath}/detailview.st?seq_study=`;
                          var result = '';
                            for(var i in data) {
                                result +='<div class="study-list-item">';
                                result +='<div class="study-list-image">';
                                result +='<img src="/uploadFile/study/' + data[i].image + '" width="250px" height="160px" style="object-fit:contain;">'; // 이미지 바인딩
                                result +='</div>';
                                result +='<div class="study-list-text">';
                                result +='<span class="field">'+data[i].topic +'</span>'; // topic 바인딩
                                result +='<i class="xi-star"></i>';
                                result +='<span class="grade">'+data[i].avg_grade+'</span><br>'; //별점 바인딩

                                result +='<a href="'+contextPath+''+data[i].seq_study+'">';
                                result +='<h3 class="study-title">'+data[i].subject+'</h3></a>'; // 주제 바인딩

                                result +='<div class="sub-info">';
                                result +='<span class="study-personnel">모집 가능 인원 : '+data[i].personnel+'</span><br>'; // 인원 바인딩
                                result +='<span class="study-time">시간 : '+data[i].time_from+'-'+data[i].time_to+'</span><br>'; // 시간 바인딩
                                result +='</div>';
                                result +='<hr>';
                                result +='<div class="user-info">';
                                result +='<div class="user-profile">';
                                result +='<img src="/uploadFile/user/' + data[i].host.profile + '" class="study-leader-image">';
                                result +='<span class="study-leader-name">' + data[i].host.nickname + '</span>'; // 스터디 만든 사람 바인딩
                                result +='</div>';
                                result +='<div class="study-region">';
                                result +='<a href="#"><i class="xi-heart"></i></a>';
                                result +='<button>'+data[i].city+'</button>'; //지역 바인딩
                                result +='<button>'+data[i].borough+'</button>'; //지역 바인딩
                                result +='</div>';
                                result +='</div>';
                                result +='</div>';
                                result +='</div>';

                                }
                                $('.study-list-item-group').html(result);
                            }

                    },

                    error:function(request, status, error) {
                        $('.study-list-item-group').html("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
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