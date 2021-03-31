<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String contextPath = request.getContextPath() ;
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SGETHER | 나에게 딱 맞는 스터디 찾기</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css ">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    
    
   
 </head>

 <body>

    <!-- User Alram & Interface Group -->
    <div class="user-alram">
        Alram :)
    </div>

    <div class="user-interface">
        <div class="user-image">
            <img src="/uploadFile/user/${sessionScope.loginfo.profile}" alt="프로필 사진" width="50px" height="50px">
        </div>

        <div class="user-name">
            <p><strong>OOO님 환영합니다 :)</strong></p>
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
                <a href="#"><h1>SGETHER</h1></a>
            </div>

            <div class="header-menu">
                <ul>
                    <li><a href="<%=contextPath%>/list.st">스터디 찾기</a></li>
                    <li><a href="#">가입 중 스터디</a></li>
                    <li><a href="#" class="login-btn">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
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


  <main>
        <section class="main-image">
            <div class="main-image-content">
                <h2>원하는 스터디를 검색해보세요!</h2>
                <p>분류별로 쉽고 정확하게, 강력한 관리 기능</p>
            </div>
        </section>
            
<!-- 스터디 목록  -->



<div> 
	<h2>스터디 만들기</h2>
</div>
	
<div>
	<c:set var="apppath" value="<%=request.getContextPath()%>" />
	<form:form modelAttribute="study" role="form" action="${apppath}/create.st" method="post">
		
		<!-- 스터디 주제  -->
		<p><form:input path="subject" type="text" name="subject" placeholder="스터디 주제 입력하세요 "/></p>
		<form:errors cssClass="err" path="subject" /> 
		
		<!--  스터디 소개  -->
		<p><form:textarea path="intrd"  cols="50" rows="10" name="intrd" placeholder="스터디 소개글 입력하세요 "></form:textarea></p>
	 	<form:errors cssClass="err" path="intrd" /> 
	 
	 	<!--  스터디 시간 from  -->
	 	<form:input path="time_from" type="time" name="time_from"/>
      	<form:errors cssClass="err" path="time_from" /> 
    	
    	<!--  스터디 시간 to  -->
       	<form:input path="time_to" type="time" name="time_to"/>
	 	<form:errors cssClass="err" path="time_to" /> 
	 	
	 	<!--  스터디 정원 입력  -->
	 	<form:input path="personnel" name="personnel" type="number" min="1" placeholder="인원"/>
		<form:errors cssClass="err" path="personnel" /> 
		
		<!--  스터디 지역 시도 단위 -->
	 	<form:select path="city" name="city" id="city"/>
	 	<form:errors cssClass="err" path="city" /> 
	 	
	 	<!--  스터디 지역 구 단위  -->
		<form:select path="borough" name="borough" id="borough"/>
 		<form:errors cssClass="err" path="borough" /> 
 		
 		<!--  스터디 토픽  -->
 		<form:select path="topic" name="topic">
                <option  value="주제">주제</option>
                <option  value="영어">영어</option>
                <option  value="개발">개발</option>
                <option  value="수학">수학</option>
                <option  value="디자인">디자인</option>
		</form:select>
		<form:errors cssClass="err" path="topic" /> 
		
		<button type="submit">스터디 만들기</button>
		
		
    </form:form>
   
   </div>
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
            <input type="text" placeholder="ID"><br>
            <input type="password" placeholder="PASSWORD"><br>
            <span><a href="#">ID 찾기</a></span>
            <span>&nbsp;|&nbsp;</span>
            <span><a href="#">비밀번호 찾기</a></span><br>
            <button><a href="#">로그인</a></button>
            <a href="#"><button class="google-login-btn"></button></a>
        </div>
    </div>
   
    

 <!-- -------스크립트 영역 ------ -->

    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

     <script>
 $('document').ready(function() {
 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
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
    
</body>
</html>