

		$("#table2 td").on("click",function(e) {
					$click=$(this);						
					var boardNo = $(this).parent().children().eq(0).children().val();
					
					var this1 = $(this);
					var boardUrl = "${contextPath}/service/${pInfo.boardType}/"
							+ boardNo + "?cp=${pInfo.currentPage}";
					/* location.href=boardUrl; */
					var ttr;
					$.ajax({
						url : boardUrl,
						type : "POST",
						data : {
							"boardNo" : boardNo
						},
						dataType : "json",
						success : function(map) {

							$ttr = $tr = $("<tr>").attr("id", "tr1");
							$td = $("<td>").attr({
								colspan : "5",
								height : "auto",
								id : "td1"
							});
							
							$divout = $("<div>").attr({
								id : "tddiv",
								height : "auto%",
								width : "100%"
							});
							
							if(map.files != null){
							
							if(map.files[0]!= null){
							var src = "${contextPath}"+map.files[0].filePath+"/"+map.files[0].fileChangeName;
							$divin2 = $("<img>").prop("src",src);
							$divout.append($divin2,"<br>");
							}
							
							if(map.files[1]!= null){
							var src = "${contextPath}"+map.files[1].filePath+"/"+map.files[1].fileChangeName;
							$divin3 = $("<img>").prop("src",src);
							$divout.append($divin3,"<br>");
							}
							
							if(map.files[2]!= null){
							var src = "${contextPath}"+map.files[2].filePath+"/"+map.files[2].fileChangeName;
							$divin4 = $("<img>").prop("src",src);
							$divout.append($divin4,"<br>");
							}
							
							if(map.files[3]!= null){
							var src = "${contextPath}"+map.files[3].filePath+"/"+map.files[3].fileChangeName;
							$divin5 = $("<img>").prop("src",src);
							$divout.append(	$divin5,"<br>");
							}
							
							}
							
							$divin = $("<div>").html(
									map.board.boardContent
							);
							
							$divout.append($divin);
							
							if(loginMember == $click.parent().children().eq(2).text().trim()){
								/* var url = "location.href="'+$("#bType").val()+"/"+boardNo+"/update?cp="+$("#cp").val()+'""; */
									var updateUrl = "location.href="+"'"+  +$("#bType").val()+"/"+boardNo+"/update?cp="+$("#cp").val()+"'";
									var deleteUrl = "location.href="+"'"+  +$("#bType").val()+"/"+boardNo+"/delete?cp="+$("#cp").val()+"'";
								
								$updateBtn = $("<button>").attr({type:"button",
															  onclick:updateUrl}).text("수정");
								$deleteBtn = $("<button>").attr("type","button").text("삭제").on("click",function(){
									  							  if(confirm("정말 삭제하시겠습니까?")){
									  								location.href=""+$("#bType").val()+"/"+boardNo+"/delete?cp="+$("#cp").val()+"";
									  							  };
									  						  });
								/* $button = $("<button>").attr({type:"button",id:"upBtn"}); */							  
								$divout.append($updateBtn,$deleteBtn);
							}
							
							$("#upBtn").on("click",function(){
								location.href=$("#bType").val()+"/"+boardNo+"/update?cp="+$("#cp").val();
							}); 
							
							
							$td.append($divout);
							$tr.append($td);
							$(this1).parent().after($tr);

							 $("#table2 td").on("click", function() {
								$divin.html("");
								$tr.remove();
							}); 

						},
						error : function() {
							console.log("ajax통신실패");
						}

					}); //
					 $('html').click(function(e) {
						if (!$(e.target).hasClass("#table2 td")) {
							 $ttr.remove();
						}
					});
				});

		//--------사이드바
		
		//--------검색동작
		$("#searchBtn").on("click",function(){
			var searchUrl="";
			var $sVal=$("input[name='sVal']");
			var $sKey=$("select[name='sKey']");
			
			if($sVal.val().trim().length == 0){
				searchUrl="${pInfo.boardType}";
			}else{
				
				searchUrl+="../search/${pInfo.boardType}?";
				searchUrl+="sKey="+$sKey.val()+"&sVal="+$sVal.val();
			}
			
			location.href=searchUrl;
		});
		
		
	