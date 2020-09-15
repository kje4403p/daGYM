<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#star a{ 
	text-decoration: none; color: gray;
 } 
 #star a.on{
  color: red;
   }

</style>
<title>Insert title here</title>
 <script src="${contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>

<div class="container">
	<div class="row" style="margin-top:40px;">
		<div class="col-md-6">
    	<div class="well well-sm">
            <div class="row" id="post-review-box" ">
                <div class="col-md-12">
                    <form accept-charset="UTF-8" action="insertReview" method="post">
                        <input id="ratings-hidden" name="rating" type="hidden"> 
                        <textarea class="form-control animated" cols="50" id="reviewContent" name="reviewContent" placeholder="Enter your review here..." rows="5"></textarea>
        
                        <div class="text-right">
                        <P id="star" name="reviewRating"> <!-- 부모 -->
								<a href="#" value="1">★</a> <!-- 자식들-->
								 <a href="#" value="2">★</a>
								  <a href="#" value="3">★</a> 
								  <a href="#" value="4">★</a> 
								  <a href="#" value="5">★</a>
						 <p>


                            <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
                            <span class="glyphicon glyphicon-remove"></span>Cancel</a>
                            <button class="btn btn-success btn-lg" type="button" id="submit">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 
         
		</div>
	</div>
</div>
<script>
$('#star a').click(function(){
	$(this).parent().children("a").removeClass("on");
	$(this).addClass("on").prevAll("a").addClass("on"); 
	console.log($(this).attr("value")); 
});
$("#submit").click(function(){
	var $content = $("#reviewContent").val();
	var url = "../insertReview"
	var no = ${trainerNo}
	console.log("트"+no)
	$.ajax({
		url : url,
		data :{"reviewContent": $content,"reviewRating" : 3, "trainerNo" : no },
		
		success : function(result){
			console.log("성공")
			if(result>0){
				alert("리뷰가 등록되었습니다.");
				window.close();
			}else{
				swal("리뷰 등록에 실패했습니다. 다시 작성해주세요.");
			}
		},error : function(){
			console.log("실패")
		}
		
	})
	
})


</script>
</body>
</html>