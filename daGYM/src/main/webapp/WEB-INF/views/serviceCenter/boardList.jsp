<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
    <style>
    	.pagination {
            justify-content: center;
        }
        #searchForm{
            position: relative;
        }

        #searchForm>*{
            top : 0;
        }
        
        .boardTitle > img{
        	width: 50px;
        	height: 50px;
        }
          
        .board-list{ margin: 100px auto;}
        
        #list-table td{
        	cursor:pointer;
        }
        
	</style>
	
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="container board-list">
		
		<h1>${boardList[0].boardName}</h1>

        <div style="height:530px">
            <table class="table table-hover table-striped" id="list-table">
                <thead>
                    <tr>
                        <th>글번호 </th>
                        <th>카테고리 </th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                
                	<c:choose>
                		<c:when test="${empty boardList}"> <!-- 페이지,리퀘스트,세션,어플중에 보드리스트를 검색해서 -->
                			<tr><td colspan="6">존재하는 게시글이 없습니다.</td></tr>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="board" items="${boardList}">
                			<!-- boardList에 있는 요소를 반복 접근 하여 board라는 변수에 저장하여 내부에서 사용 -->
                			<tr>
                				<td>${board.boardNo}</td>
                				<td>${board.boardCategory}</td>
                				<td class="boardTitle">
                				<c:forEach items="${thList}" var="th">
									  <c:if test="${th.parentBoardNo==board.boardNo}">
									  <%-- 현재 출력중인 게시글 목록 번호와 일치하는 썸네일 있을 경우 --%>
									  	<c:set var="src" value="${contextPath}${th.filePath}/${th.fileChangeName}"/>
									  						<%--spring/  resources/uploadImages/  209412412_adf.jpg --%>
									  	<img src="${src}"/>	
									  </c:if>
                				</c:forEach>
                				
                				${board.boardTitle}</td>
                				<td>${board.boardWriter}</td>
                				<td>${board.readCount}</td>
                				<td>
                						
                						<%-- jsp:useBean:jsp로 객체만들어 활용하겠다 --%>
                						<jsp:useBean id="now" class="java.util.Date"/>
                						<%-- Date now = new Date();와 같음. 데이트객체는 기본생성자로 객체만들면 현재시간--%>
                						
                						<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
                						<%--데이트 형식의 포맷을 어떻게 표기할거냐 , 현재시간의 패턴을 저렇게 한 문자열로 today에 저장--%>
                						
                						<fmt:formatDate var="createDate" value="${board.boardCreateDate}" pattern="yyyy-MM-dd"/>
                						
                						<fmt:formatDate var="createTime" value="${board.boardCreateDate}" pattern="hh:mm:ss"/>
                						<c:choose>
                						
                						<c:when test="${today == createDate}"> <%-- 투데이라는 문자열과 크리에이트 문자열과 같다면 --%>
                							${createTime}
                						</c:when>
                						
                						<c:otherwise>
                							${createDate}
                						</c:otherwise>
                					</c:choose>
                					
                				</td>
                			</tr>
                			</c:forEach>
                			
                		</c:otherwise>
                	</c:choose>
                
                </tbody>
            </table>
        </div>

        <hr>
        
        <%-- 로그인이 되어있는 경우에만 글쓰기 버튼 보이게 하기 --%>
        
        	<c:if test="${!empty loginMember}"> 
        	 	<a class="btn btn-primary float-right" href="../${boardList[0].boardType}/insert">글쓰기</a>
			</c:if>
      	<!--------------------------------- 페이징바  ---------------------------------->
	      
	     <%-------- 검색 파라미터가 포함된 url 생성--------%>
	     <%-- c:url은 url생성 value는 주소--%>
	     <%-- /1?ct=운동&ct=영화&sKey=tit같은 쿼리스트링이 유지가 되면서 마지막에 &cp=2 값이 변하게 만듬. --%>
	     <c:url var="searchParameter" value="${pInfo.boardType}">
	     		
	     		<%-- 파라미터중 ct가 비어있지 않으면 ct는 배열이라 Values --%>
	     		<c:if test="${!empty paramValues.ct}"> <%--ct는 배열 --%>
	     			<c:forEach var="ctName" items="${paramValues.ct}">
	     				<c:param name="ct" value="${ctName}"/> <%--c:param은 url뒤에 쿼리스트링으로 붙음  &ct=0 이게 반복 --%>
	     				<%-- 포문이 한번 돌때마다 ?ct=0 &ct=1 &ct=x 이런식으로 붙음 --%>
	     			</c:forEach>
	     		</c:if>
	     		
	     		<c:if test="${!empty param.sVal}">
	     			<c:param name="sKey" value="${param.sKey}"/>
	     			<c:param name="sVal" value="${param.sVal}"/>
	     		</c:if>
	     </c:url>
	    
	     
	     <%---------검색 파라미터가 있을 경우 / 없을 경우 url 가공 -----------%>
	     <%-- +상세조회 목록으로 버튼 주소 가공 --%>
	     <!-- 검색 파라미터가 있을 경우 : serach/1?ct=운동&ct=영화&sKey=tit&sVal=test&cp=2
	   		    검색 파라미터가 없는 경우 : list/1?cp=2 
	   		    끝에가 ? 냐  &냐 차이를 가공처리  -> 뒤에 기호를 붙이고 cp를 붙이는 작업 
	   		    위에 searchParameter에선 이거 전 구문까지만 생성됨.-->
	     <c:choose>
	     	<%-- 검색조건 존재하는 경우(파라미터 cp가 쿼리스트링 제일 마지막에 추가될 수 있도록 '&'기호 추가 --%>
	     	<c:when test="${!empty paramValues.ct || !empty param.sVal}"> <%-- ||는 또는 --%>
	     		<c:set var ="url" value="${searchParameter}&cp="/>
	     		<c:set var="listUrl" value="../search/${url}${pInfo.currentPage}" scope="session"/>
	     		<%-- 세션레벨은 브라우저가 꺼지지 않는한 유지가됨 --%>
	     	</c:when>
	     	
	     	<%-- 검색 조건 존재하지 않는 경우(파라미터 cp가 쿼리스트링 제일 앞에 추가될 수 있도록 '?' 기호추가 --%>
	     	<c:otherwise>
	     		<c:set var ="url" value="${searchParameter}?cp="/>
	     		<c:set var="listUrl" value="../list/${url}${pInfo.currentPage}" scope="session"/>
	     	</c:otherwise>
	     </c:choose>
	     
		<div class="my-4">
            <ul class="pagination">
            	<c:if test="${pInfo.currentPage > pInfo.pagingBarSize}"><!-- 11페이지부터 밑에 노출되게함. -->
	                <li>
	                	<!-- 맨 처음으로(<<) -->               <!-- 상대경로라서 주소뒷자리만 바뀜 -->
	                   <%--  <a class="page-link text-primary" href="${pInfo.boardType}?cp=1">&lt;&lt;</a> --%>
	                    									<!-- 1?cp=1 (1번타입의 게시판에 1페이지로 돌아가라)-->
	                    	<a class="page-link text-primary" href="${url}1"> v</a>
	                </li>
	                
	                <li>
	                	<!-- 이전으로(<) -->
	                	<!-- prev 생성 식 : (현재페이지-1) / 페이징바 사이즈(10)*10  한거를 prev에 저장  (*10를 하려면 앞 계산이 소수점이 버린형태가 되어야함 -->
	                	
	                	<!-- fmt태그를 이용한 소수점 제거 -->		<%-- el jstl은 자료형이 존재 하지 않아서 계산결과가0.4라면 그대로0.4가 나옴 --%>
	                	<fmt:parseNumber var="operand1" value="${(pInfo.currentPage-1)/pInfo.pagingBarSize}"
	                	integerOnly="true"/>  <%-- integerOnly="true" : 소수점 버림 --%>
	                		<%-- 오퍼랜드1은 피연산자(연산을 한번더 당할연산자) --%>
                   		<c:set var="prev" value="${operand1 *10}"/> <%-- 오퍼랜드에 따로 10을 곱하는 이유는 1.2에 10곱하면 12가 되버림. 10이 나오게 하기위해 --%>
                   		<%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${prev}">&lt;</a> --%>
                   		<a class="page-link text-primary" href="${url}${prev}">&lt;</a>
                   															<!-- 이전페이지 누르면 그전 끝의페이지로 넘어감 -->
	                </li>
	            </c:if>
	            
	            <!-- 10개의 페이지 목록 --> <!-- 10번반복 해야하니 포이치 문 -->
	            <c:forEach var="p" begin="${pInfo.startPage}" end="${pInfo.endPage}">
	            					<%--begin:몇부터 시작할건지  ,     끝나는 부분   ,1씩 증가--%>
	            	<c:choose>
	            		<c:when test="${p==pInfo.currentPage}"><%-- 현재증가하고 있는 p와 현재페이지가 같으면 --%>
	           			    <li><a class="page-link">${p}</a></li> <%-- href를 적지 않고 단순 텍스트 클릭x --%>
	           			  </c:when>
	           			  
	           			  <c:otherwise>
	           			  
	                		<li>
	                			<%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${p}">${p}</a> --%>
	                			<a class="page-link text-primary" href="${url}${p}">${p}</a>
	                													<%-- 1?cp=3 이면 3클릭하면 3페이지이동 --%>
		                	</li>
	           			  </c:otherwise>
                	</c:choose>
	             </c:forEach>
                
                
                <!-- 다음 페이지로(>) -->
                <!-- next 생성 식: (현재페이지 + 9)/10*10 +1 -->
                <c:if test="${pInfo.maxPage > pInfo.endPage}"><%-- 최대페이지수 > 페이징바 사이즈에서 보여지는 마지막페이지 --%>
	                <li>
	                	<fmt:parseNumber var="operand2" value="${(pInfo.currentPage +pInfo.pagingBarSize-1)/pInfo.pagingBarSize }" integerOnly="true"/>
	                	<c:set var="next" value="${operand2* 10 +1 }"/>
						<%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${next}">&gt;</a> --%>
						<a class="page-link text-primary" href="${url}${next}">&gt;</a>
	                </li>
	                
	                <!-- 맨 끝으로(>>) -->
	                <li>
	                    <%-- <a class="page-link text-primary" href="${pInfo.boardType}?cp=${pInfo.maxPage}">&gt;&gt;</a> --%>
	                    <a class="page-link text-primary" href="${url}${pInfo.maxPage}">&gt;&gt;</a>
	                </li>
	               </c:if>
            </ul>
        </div>	     

        <div>
            <div  class="text-center" id="searchForm" style="margin-bottom:100px;">
                <span>
                    	카테고리(다중 선택 가능)<br>
                    <label for="exercise">운동</label> 
                    <input type="checkbox" name="ct" value="운동" id="exercise">
                    &nbsp;
                    <label for="movie">영화</label> 
                    <input type="checkbox" name="ct" value="영화" id="movie">
                    &nbsp;
                    <label for="music">음악</label> 
                    <input type="checkbox" name="ct" value="음악" id="music">
                    &nbsp;
                    <label for="cooking">요리</label> 
                    <input type="checkbox" name="ct" value="요리" id="cooking">
                    &nbsp;
                    <label for="game">게임</label> 
                    <input type="checkbox" name="ct" value="게임" id="game">
                    &nbsp;
                    <label for="etc">기타</label> 
                    <input type="checkbox" name="ct" value="기타" id="etc">
                    &nbsp;
                </span>
                <br>
                <select name="sKey" class="form-control" style="width:100px; display: inline-block;">
                    <option value="tit">글제목</option>
                    <option value="con">내용</option>
                    <option value="tit-con">제목+내용</option>
                </select>
                <input type="text" name="sVal" class="form-control" style="width:25%; display: inline-block;">
                <button class="form-control btn btn-primary" id="searchBtn" type="button" style="width:100px; display: inline-block;">검색</button>
            </div>
            
            
        </div>
   	
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		//게시글 상세보기 기능 구현
		$(function(){
		   $("#list-table td").on("click",function(){
			  	var boardNo = $(this).parent().children().eq(0).text();
			  		/* 글번호 */	/* this=td 의 부모 parent<tr>*/
			  
			  	/* 게시글 상세조회 요청주소 */
		  		var boardUrl = 
			  			"${contextPath}/board/${pInfo.boardType}/"+boardNo+"?cp=${pInfo.currentPage}";   
			  		/* ${cotextPath}헤더에 어플리케이션 스코프로 등록된 주소 */ /* spring/board/1/500?cp=3 */
		   		
			  		
			  		//@PathValue 방식 : 구분되어야 하는 리소스를 호출하는 url로 사용 //요즘은 이런방식사용
			  		//spring/board/1/500?cp=3
			  				
			  		//파라미터(쿼리스트링) : 정렬, 필터링 용도로 사용할때 씀
			  		//spring/board?type=1&boardNo=500&cp=3
			  		
			  		//게시글 상세조회 요청
			  		location.href=boardUrl;
		   });
		});
		
		
		// --------------------검색 버튼 동작---------------------
		$("#searchBtn").on("click",function(){
			// 검색 값에 따라 url을 조합하여 저장할 변수
			var searchUrl="";
			
			// 검색에 필요한 요소(카테고리, 검색조건, 검색어) 읽어오기
			var $ct = $("input[name='ct']:checked") //카테고리 네임이 ct인애들중 체크된것들 배열로 반환됨
			var $sKey = $("select[name='sKey']");
			var $sVal=$("input[name='sVal']");
			
			// 1) 검색에 필요한 카테고리 또는 검색어가 입력 되었는지 확인
			// -입력이 되지 않은 경우 -> 해당게시판 첫페이지로 돌아가는 url
			// - 하나라도 입력된 경우 -> 검색 url 생성(쿼리스트링 조합 작업 필요)
			//if()
			$ct.each(function(index,item){
				console.log($(item).val());
			});
				
			console.log($sKey.val());
			console.log($sVal.val());
			
			// 선택된 카테고리의 개수가 0이고, 입력된 검색어의 길이가 0인 경우
			// == 카테고리 체크가 안되어있고 , 검색어 입력 이 안된 태로 검색버튼을 클릭한 경우
			// ->해당 게시판의 첫 페이지로 이동
			if($ct.length == 0 && $sVal.val().trim().length ==0){
				searchUrl ="${pInfo.boardType}";  //${pInfo.boardType} == 1
			
			// 카테고리가 체크 되었거나,검색어가 입력된 경우 또는 둘다
			}else{
				// http://localhost:8080/spring/board/list/1
				searchUrl ="../search/${pInfo.boardType}?"; //검색 요청  url 
													//?는 쿼리스트링 시작을 의미 (파라미터작성)
				// 카테고리가 체크된 경우 
				if($ct.length !=0){
					// $ct 배열에 반복 접근 하여 쿼리스트링에 추가
					$ct.each(function(index,item){//인덱스:현재 반복접근중인 요소순서, 아이템 요소값
						//ct=운동&ct=영화&ct=음악&ct=기타
						//index는0부터 증가
						if(index !=0){ // 0번인덱스를 제외한 모두 앞에  &붙임
							searchUrl += "&";
						}
						searchUrl +="ct=" + $(item).val();
					});
					
					//카테고리 반복 접근이 끝난 후 검색어가 있을 경우
					//쿼리스트링을 이어서 작성할 수 있도록 '&' 기호 추가
					if($sVal.val().trim().length != 0) searchUrl += "&";
				}
				//검색어가 입력된 경우
				if($sVal.val().trim().length != 0){
					searchUrl +="sKey="+$sKey.val()+"&sVal=" +$sVal.val();
					
				}
				
				
			}//else end
			
			
			//2) location.href를 통해 검색 요청 전달
			location.href = searchUrl; 
	        //${contextpath}로 시작하거나 / 로 시작하는것을 제외한 전부 상대경로 라서 맨 뒷자리만 바뀜.
	        //http://localhost:8080/spring/board/list/1
	        										//$pInfo.boardType}==1
		});		
	     	
	     	
	     //----------------------검색 값 유지------------------------
	     $(function(){
	    	var sKey ="${param.sKey}";/* 파라미터상에 존재 하는 skey가져오기 */
	    	var sVal ="${param.sVal}";
	    	/* EL로 값을 가져올때는 "" 없을시 그냥 tit같은 변수명을 가리키기 때문에 문자열로 값을 가져오기위해 따옴표를 붙임 */
	    	 
	    	//EL 구문에서 값이 없을 경우 ""(빈문자열)이 반환됨
	    	
	    	if(sKey !="" && sVal !=""){
	    		//검색어 세팅
	    		$("input[name='sVal']").val(sVal);
	    		
	    		//검색 조건 세팅
	    		$("select[name='sKey'] > option").each(function(index,item){
	    			
	    			if($(item).val()==sKey){
	    		/* $(item).val() = tit,con,tit-con 중에 하나 나옴 */
	    				$(item).prop("selected",true);
	    			}
	    		});
	    	}
	    	
	    	
	    	
	    	//카테고리(체크박스) 값 세팅
	    	//script 태그 내에 EL/JSTL 사용하기
	    	
	    	//HTML, JS/jQuery(JS의 라이브러리) ,Scriptlet(Java),EL/JSTL
	    	// 서버 동작시 JSP 파일 코드 해석 순서
	    	// 1)Java > 2) EL/JSTL > 3) HTML > 4)JS/jQuery
	    	//EL/JSTL은 JSP를 편하게 쓸수 있게 만든것으로 자바임 jsp도 자바
	    	
	    	// EL/JSTL 구문은 JS/jQuery보다 해석이 빠르므로
	    	// JS구문 내에 EL/JSTL 구문을 작성하여 혼용할수 있다.
	    	// 아래 방법은 JSTL과 자바스크립트 혼용
	    	<c:forEach var="ctName" items="${paramValues.ct}">
				$("input[name='ct']").each(function(index,item){
					
					if($(item).val()=="${ctName}"){ // ${ctName} 을 문자열로 만들기 위해 ""안에 넣음
						$(item).prop("checked",true);
					}
				});    	
	    	</c:forEach>
	     });
	     
	     //-----------------검색창 엔터 이벤트-----------------------
	     //버튼이 폼태그 안에 있으면 엔터 누르면 작동하지만 div태그 안이라 엔터로 작동을 하지 않으므로 작동하게 만듬
	     /* event 여기서 발생한 모든 이벤트가 담김  */
	     $("input[name='sVal']").on("keyup",function(event){ 
	    	// console.log(event.keyCode);//키업 이벤트가 발생할 경우 입력한 키 값이 출력됨.
	    	if(event.keyCode==13){ //엔터키가 눌려진 경우
	    		$("#searchBtn").click(); //검색 버튼 클릭
	    	}
	     });
		
	</script>
	
	
	
</body>
</html>
