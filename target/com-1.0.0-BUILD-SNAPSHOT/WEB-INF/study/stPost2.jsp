<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<form action="<%=contextPath%>/post.st" method="post" id = "uploadForm">
	<!-- 상단 메뉴  -->
		<div style="height: 60px; background-color: skyblue;">
			<div style="margin-left: 20%; ">
				<div style="float: left;">
					SGETHER
				</div>
				
				<div style="float: left; margin-left: 8%;">
					메뉴
				</div> 
				
				<div style="float: left;margin-left: 3%;">
					메뉴
				</div>
				
				<div style="float: left;margin-left: 3%;">
					메뉴
				</div>
			</div>
		</div>
		
	
	<div style=" height: 20px; background-color: lightgray;; margin-top: 1%;">
		<div style="margin-left: 21%; margin-right: 20%;">
			<div>스터디 포스트 </div>
		</div>
	</div>		
	
	<div style="width: 100%; float: left; margin-left: 88%;">
		오른쪽 가입한 맴버 
		<c:forEach var = "nick" items="${nickname }">
			<h3>${nick.nickname}</h3>
		</c:forEach>
		
	</div>	
	
	
	<!-- 내 댓글 입력 -->
	<div style="margin-left: 21%;margin-right: 20%;margin-top: 5%; height: 150px; ">
		<div style="background-color: skyblue; border-radius: 10px 10px 10px 10px; height: 380px;">
			<div style="border-top: 27px solid skyblue;border-left: 70px solid skyblue;">
				<div style="float: left;">
					<img src="./../images/user_1.png">
				</div>
				
				<div style="float: left; margin-left: 0%; width: 100%">
					<!-- <input type = "text" name = "content" style="width: 1100px; height: 200px;"> -->
					 
						   <table class="table"border="1px" style="width: 93.5%;">
					            <tbody id="fileTableTbody">
					                <tr>
					                    <td id="dropZone">
					                        파일을 드래그 하세요
					                    </td>
					                </tr>
					            </tbody>
					       </table>
					       <br>
					<textarea id = "" class = "content" rows="15" cols="135" placeholder="할말하슈" name = "content"></textarea>
				</div>
				
				<div style="margin-left: 91%;margin-top: 22%">
					<input type = "submit" value ="등록">
				</div>
			</div>
		</div>
	</div>
	<div style="    width: 100%;
    margin-top: 15%;
    margin-left: 41%;">
		<h1 id = str></h1>
		<input type ="text" id = "test" name = "file1"><br>
		<input type = "text" name = "seq_study" value = "${seq_study }"><br>
		<input type = "text" name = "mid" value = "${mid }">
	</div>
	
	<c:forEach var = "bean" items="${post }">
	<div style="margin-left: 21%;margin-right: 20%;margin-top: 15%; height: 150px; ">
		<div style="background-color: skyblue; border-radius: 10px 10px 10px 10px; height: 350px;">
			<div style="border-top: 27px solid skyblue;border-left: 70px solid skyblue;">
				<div style="float: left;">
					<img src="<%=contextPath%>/WEB-INF/images/user_1.png" alt="${bean.nickname }">${bean.inputdate }
				</div>
				<input type = "text" value ="${ bean.seq_post}">
				<div style="float: left; margin-left: 0%; width: 100%">
					<%-- <div style="background-color: white; width: 100%; margin-right: 20%;">
						${bean.content }
					</div> --%>
					<textarea rows="15" cols="135">${bean.content }</textarea>
					<%-- <input type = "text" name = "content" value = "${bean.content }" style="width: 1100px; height: 200px;"> --%>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
	</form>
	

</body>
<script type="text/javascript">
/* $('.content')
.on("dragover", dragOver)
.on("dragleave", dragOver)
.on("drop", uploadFiles);

function dragOver(e){
e.stopPropagation();
e.preventDefault();
}

function uploadFiles(e){
e.stopPropagation();
e.preventDefault();
}



function dragOver(e) {
    e.stopPropagation();
    e.preventDefault();
    if (e.type == "dragover") {
        $(e.target).css({
            "background-color": "#e6e5e5",
        });
    } else {
        $(e.target).css({
            "background-color": "#e6e5e5",
        });
    }
}

function uploadFiles(e) {
    e.stopPropagation();
    e.preventDefault();
    dragOver(e); //1
 
    e.dataTransfer = e.originalEvent.dataTransfer; //2
    var files = e.target.files || e.dataTransfer.files;
    var files1 = e.originalEvent.dataTransfer.files;

    if (files.length > 1) {
        alert('하나만 올려라.');
        return;
    }


    console.log(files1);
    //console.log( files.split("_"));
    console.log(files);
    console.log(files1.name);
    for(var i = 0; i < files.length; i++){
        // 파일 이름
        var fileName = files[i].name;
        console.log(fileName);
    }


    
    document.querySelector("#str").innerHTML = fileName;
    document.querySelector(".content").innerHTML = "첨부 파일명 : "+fileName+"\n";
    $('#test').val(fileName);

} */

//파일 리스트 번호
var fileIndex = 0;
// 등록할 전체 파일 사이즈
var totalFileSize = 0;
// 파일 리스트
var fileList = new Array();
// 파일 사이즈 리스트
var fileSizeList = new Array();
// 등록 가능한 파일 사이즈 MB
var uploadSize = 50;
// 등록 가능한 총 파일 사이즈 MB
var maxUploadSize = 500;

$(function (){
    // 파일 드롭 다운
    fileDropDown();
});

// 파일 드롭 다운
function fileDropDown(){
    var dropZone = $("#dropZone");
    //Drag기능 
    dropZone.on('dragenter',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone.css('background-color','#E3F2FC');
    });
    dropZone.on('dragleave',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone.css('background-color','#FFFFFF');
    });
    dropZone.on('dragover',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone.css('background-color','#E3F2FC');
    });
    dropZone.on('drop',function(e){
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone.css('background-color','#FFFFFF');
        
        var files = e.originalEvent.dataTransfer.files;
        if(files != null){
            if(files.length < 1){
                alert("폴더 업로드 불가");
                return;
            }
            selectFile(files)
        }else{
            alert("ERROR");
        }
    });
}

// 파일 선택시
function selectFile(files){
    // 다중파일 등록
    if(files != null){
        for(var i = 0; i < files.length; i++){
            // 파일 이름
            var fileName = files[i].name;
            var fileNameArr = fileName.split("\.");
            // 확장자
            var ext = fileNameArr[fileNameArr.length - 1];
            // 파일 사이즈(단위 :MB)
            var fileSize = files[i].size / 1024 / 1024;
            
            if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                // 확장자 체크
                alert("등록 불가 확장자");
                break;
            }else if(fileSize > uploadSize){
                // 파일 사이즈 체크
                alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                break;
            }else{
                // 전체 파일 사이즈
                totalFileSize += fileSize;
                
                // 파일 배열에 넣기
                fileList[fileIndex] = files[i];
                
                // 파일 사이즈 배열에 넣기
                fileSizeList[fileIndex] = fileSize;

                // 업로드 파일 목록 생성
                addFileList(fileIndex, fileName, fileSize);

                // 파일 번호 증가
                fileIndex++;
            }
        }
    }else{
        alert("ERROR");
    }
}

// 업로드 파일 목록 생성
function addFileList(fIndex, fileName, fileSize){
    var html = "";
    html += "<tr id='fileTr_" + fIndex + "'>";
    html += "    <td class='left' >";
    html +=         fileName + " / " + fileSize + "MB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'>삭제</a>"
    html += "    </td>"
    html += "</tr>"

    $('#fileTableTbody').append(html);
    $('#test').val(fileName);
}

// 업로드 파일 삭제
function deleteFile(fIndex){
    // 전체 파일 사이즈 수정
    totalFileSize -= fileSizeList[fIndex];
    
    // 파일 배열에서 삭제
    delete fileList[fIndex];
    
    // 파일 사이즈 배열 삭제
    delete fileSizeList[fIndex];
    
    // 업로드 파일 테이블 목록에서 삭제
    $("#fileTr_" + fIndex).remove();
}

// 파일 등록
function uploadFile(){
    // 등록할 파일 리스트
    var uploadFileList = Object.keys(fileList);

    // 파일이 있는지 체크
    if(uploadFileList.length == 0){
        // 파일등록 경고창
        alert("파일이 없습니다.");
        return;
    }
    
    // 용량을 500MB를 넘을 경우 업로드 불가
    if(totalFileSize > maxUploadSize){
        // 파일 사이즈 초과 경고창
        alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
        return;
    }
        
    if(confirm("등록 하시겠습니까?")){
        // 등록할 파일 리스트를 formData로 데이터 입력
        var form = $('#uploadForm');
        var formData = new FormData(form);
        for(var i = 0; i < uploadFileList.length; i++){
            formData.append('files', fileList[uploadFileList[i]]);
        }
        
        $.ajax({
            url:"C://upload",
            data:formData,
            type:'POST',
            enctype:'multipart/form-data',
            processData:false,
            contentType:false,
            dataType:'json',
            cache:false,
            success:function(result){
                if(result.data.length > 0){
                    alert("성공");
                    location.reload();
                }else{
                    alert("실패");
                    location.reload();
                }
            }
        });
    }
}






</script>
</html>