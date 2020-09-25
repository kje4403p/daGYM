<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
/*댓글*/
.replyWrite>table {
	width: 90%;
	margin-top : 100px;
}

#replyContentArea {
	width: 90%;
}

#replyContentArea>textarea {
	resize: none;
	width: 100%;
}

#replyBtnArea {
	width: 100px;
	text-align: center;
}

.rWriter {
	display : inline-block;
	margin-right: 30px;
	vertical-align: top;
	font-weight: bold;
	font-size: 1.2em;
}

.rDate {
	display : inline-block;
	font-size: 0.5em;
	color: gray;
}

#replyListArea {
	list-style-type: none;
}

.rContent, .btnArea{
	display: inline-block;
	box-sizing: border-box;
}

.rContent {
	height: 100%;
	width : 100%;
	word-break:normal;
}

.btnArea {
	height: 100%;
	width : 180px;
	text-align: right;
	float: right;
    margin-bottom: 10px;
}

hr{
    clear: both;
}

.replyUpdateContent{
	resize: none;
	width: 70%;
}




</style>
<div id="reply-area ">
	<!-- 댓글 작성 부분 -->
	<div class="replyWrite">
		<table align="center">
			<tr>
				<td id="replyContentArea"><textArea rows="3" id="replyContent"></textArea>
				</td>
				<td id="replyBtnArea">
					<button class="btn btn-primary" id="addReply">댓글<br>등록</button>
				</td>
				
			</tr>
		</table>
	</div>


	<!-- 댓글 출력 부분 -->
	<div class="replyList mt-5 pt-2">
		<ul id="replyListArea">
		</ul>
	</div>

	
</div>

<script>


// 댓글
// 페이지 로딩 완료 시 댓글 목록 호출
$(function(){
	selectReplyList();
});

// 댓글 목록 불러오기
function selectReplyList(){
	var url = "selectReplys/${board.boardNo}";
	
	$.ajax({
		url : url,
		type : "POST",
		dataType: "JSON",
		
		success:function(rList){

			var $replyListArea = $("#replyListArea");
			
			$replyListArea.html(""); // 기존 정보 초기화
			
			// 로그인한 멤버의 아이디를 저장할 변수
			var loginMemberId = "${loginMember.memberId}";
			
			$.each(rList, function(i){
				console.log(rList[i]);
				var $li = $("<li>").addClass("reply-row").attr("id", rList[i].replyNo);
				
				// 작성자, 작성일, 수정일 영역 
				var $div = $("<div>");
				var $rWriter = $("<a>").addClass("rWriter idSelect").html(rList[i].memberId);
				var $rDate = $("<p>").addClass("rDate")
								.html("작성일 : " + rList[i].replyEnrollDt + "<br>");
				
				$div.append($rWriter).append($rDate);
				var replyNo = rList[i].replyNo;
				
				
				// 댓글 내용
				var $rContent = $("<p>").addClass("rContent").html(rList[i].replyContent);
				
				
				// 답글, 수정, 삭제 버튼 영역
				var $btnArea = $("<div>").addClass("btnArea");
				
				
				// 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
				if(rList[i].memberId == loginMemberId){
					
					var $showUpdate = $("<button>").addClass("btn btn-sm btn-primary ml-1").attr("onclick","selectReply("+ replyNo + ")").text("수정");
					var $deleteReply = $("<button>").addClass("btn btn-sm btn-primary ml-1").attr("onclick","deleteReply("+ replyNo + ")").text("삭제");
					$btnArea.append($showUpdate, $deleteReply);
				}
				
				
				// 댓글 경계선
				var $hr = $("<hr>");
		
				
				// 댓글 하나로 합치기
				$li.append($div).append($rContent).append($btnArea);
				
				// 댓글 영역을 화면에 배치
				$replyListArea.append($li).append($hr);
			});
			
			}, error : function(request, status, error){
			 	console.log("ajax 통신 오류");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        
		}
	});
}

//-----------------------------------------------------------------------------------------

// 댓글 등록
$("#addReply").on("click", function(){
	
	// 댓글 내용을 얻어와 변수에 저장
	var replyContent = $("#replyContent").val();
	
	// 로그인이 되어있지 않은 경우
	if(${empty loginMember} == true) {
		alert("로그인 후 이용해 주세요.");	
		
	}else{
		// 댓글이 작성되었는지 유효성 검사
		if(replyContent.trim().length == 0){
			alert("댓글 작성 후 클릭해주세요.");
			$("#replyContent").focus();
			
		// 로그인이 되어있고, 댓글이 작성이 된 상태로 댓글 등록 버튼이 클릭된 경우
		}else{
			var url = "insertReply/${board.boardNo}";
			var memberId = "${loginMember.memberNo}"; // 회원 아이디에 회원 번호를 저장해서 전달
				$.ajax({
					url : url,
					type : "POST",
					data : {"memberNo" : memberId,
							"replyContent" : replyContent},
					success : function(result){
						alert(result);
						$("#replyContent").val(""); // 기존 댓글 삭제
						selectReplyList();
					},error : function(){
						console.log("통신 실패");
					}
			});
		}
	} 
});

function deleteReply(replyNo) {
	if (confirm("댓글을 정말 삭제하시겠습니까?")){
		var url = "deleteReply/"+replyNo;
		$.ajax({
			url : url,
			type : "POST",
			success : function(result) {
				alert(result);
				selectReplyList();
			}, error : function(){
				console.log("통신 실패");
			}
		})
	}
}

function selectReply(replyNo) {
	var url = "updateReply/" +replyNo;
	console.log(replyNo);
	$.ajax({
		url : url,
		data : replyNo,
		type : "GET",
		success : function(content){
			updateReplyForm(replyNo, content);
		}, error : function(){
			console.log("통신 실패");
		}
	})
}

function updateReplyForm(replyNo, content) {
	
	
	var $replyListArea = $("#"+replyNo+" .rContent").parent();
	
	$("#"+replyNo+" .rContent").detach();
	$("#"+replyNo+" .btnArea").detach();
	

	$cancel = $("<div>").addClass("btn btn-sm btn-light mb-2").attr("onclick","selectReplyList()").text("수정취소");
	$rContent = $("<textarea>").css({'resize':'none', 'width': '100%', 'height':'100px'}).val(content);
	
	var replyContent = $rContent.val();
	
	var $btnArea = $("<div>").addClass("btnArea");
	/* var $updateBtn = $("<div>").addClass("btn btn-sm btn-primary ml-1").attr("onclick","updateReply("+replyNo + ",'"+replyContent +"')").text("수정완료"); */
	var $updateBtn = $("<div>").addClass("btn btn-sm btn-primary ml-1").attr("onclick","updateReply("+replyNo + ",'"+replyContent +"', this)").text("수정완료");
	
	
	$btnArea.append($updateBtn);
	
	
	$replyListArea.append($cancel).append($rContent).append($updateBtn);
	
	
}

function updateReply (replyNo, replyContent, el) {
	var url = "updateReply";
	
	var sendData = {'replyNo': replyNo, 'replyContent' : $(el).prev().val()};
	$.ajax({
		url : url,
		type : "POST",
		data : sendData,
		success : function(result){
			selectReplyList();
		},
		
	    error:function(){
	    	console.log("통신 실패");
	    }

	})
}


</script>