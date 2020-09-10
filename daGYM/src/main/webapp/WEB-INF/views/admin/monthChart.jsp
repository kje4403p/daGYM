<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월별 매출 조회</title>
<style>
	#year {
		width: 80px;}
</style>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../admin/sidebar.jsp"/>
		
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../admin/navbar.jsp"/>
			
			<div class="main-panel">
				<div class="content-wrapper">
		            <div class="page-header" style="float: left">
		              <h3 class="page-title">매출 조회</h3>
		              <form action="" class="ml-3">
		              	<jsp:useBean id="now" class="java.util.Date"/>
		              	<fmt:formatDate var="year" value="${now}" pattern="yyyy"/>
		              	<input type="number" id="year" maxlength="4" oninput="maxLengthCheck(this)" value="${year}" required>
		              	<label>년도</label>
		              </form>
		            </div>
		            <div class="row" style="clear: both;">
		              <div class="col-lg-8 grid-margin stretch-card">
		                <div class="card">
		                  <div class="card-body">
		                    <h4 class="card-title">월별 매출 조회</h4>
		                    <canvas id="monthChart"></canvas>
		                  </div>
		                </div>
		              </div>
		            </div>
				</div>
				
				<jsp:include page="../admin/footer.jsp"/>
			</div>
		</div>
	</div>
	
	<script>
		// 년도 input 태그 4자리 제한
		function maxLengthCheck(obj) {
			if(obj.value.length > obj.maxLength) {
				obj.value = obj.value.slice(0, obj.maxLength);
			}
		}
		
		monthChart($("#year").val());
		
		$(function() {
			$("#year").on("change", function() {
				monthChart($(this).val());
			});
		});
		
		function monthChart($year){
			$.ajax({
				url : "monthChartView",
				data : {"year" : $year},
				dataType : "JSON",
				success : function(list){
					monthChartView(list);
				},error : function(){
					console.log("통신실패")
				}
			});
		}
		
		var ctx = document.getElementById('monthChart');
		var myChart = null;
		function monthChartView(list){
				console.log(list)
				
				var config = {
					
						data: {
							labels: [ // Date Objects
								
							],
							datasets: [{
								label: '매출(단위 : 원)',
								type: 'line',
								lineTension: 0,
								backgroundColor: [
							        'rgba(255, 159, 64, 0.2)',
							        'rgba(255, 99, 132, 0.2)',
							        'rgba(54, 162, 235, 0.2)',
							        'rgba(255, 206, 86, 0.2)',
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(153, 102, 255, 0.2)'
							      ],
								borderColor: [
							        'rgba(255, 159, 64, 1)',
							        'rgba(255,99,132,1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)',
							        'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)'
							      ],
							      pointBackgroundColor: [
								        'rgba(255, 159, 64, 1)',
								        'rgba(255,99,132,1)',
								        'rgba(54, 162, 235, 1)',
								        'rgba(255, 206, 86, 1)',
								        'rgba(75, 192, 192, 1)',
								        'rgba(153, 102, 255, 1)'
								      ],
								  pointRadius: 5,
								  pointHoverRadius: 5,
							      pointHitRadius: 50,
							      borderWidth: 1,
							      fill: true,
								data: [
									
								],
							}]
						},
						options: {
							 scales: {
							      yAxes: [{
						    	  	ticks: {
						              beginAtZero: true
						            },
							        gridLines: {
							          color: "rgba(204, 204, 204,0.1)"
							        }
							      }],
							      xAxes: [{
							        gridLines: {
							          color: "rgba(204, 204, 204,0.1)"
							        }
							      }]
							    },
							    
							    xAxes: [{
							        gridLines: {
							          color: "rgba(204, 204, 204,0.1)"
							        }
							      }]
						}
					};
				
				//차트 업데이트
				//라벨추가
				for(var i=0; i<list.length; i++){
					//데이터셋의 데이터 추가
					config.data.labels.push(list[i].paymentDate);
				}
				
				//데이터셋 수 만큼 반복
				var dataset = config.data.datasets;
				for(var i=0; i<dataset.length; i++){
					//데이터셋의 데이터 추가
					for(var j=0 ; j<list.length; j++){
						dataset[i].data.push(list[j].amount);
					}
					
				}
				if(myChart == null) {
					myChart = new Chart(ctx, config);
				} else {
					myChart.config = config;
					myChart.update();
				}
		
		
		
		/*if ($("#monthChart").length) {
		    var barChartCanvas = $("#monthChart").get(0).getContext("2d");
		    // This will get the first returned node in the jQuery collection.
		    var barChart = new Chart(barChartCanvas, {
		      type: 'line',
		      data: data,
		      options: options
		    });
		}*/
	}
		
		
		
		
	
	</script>
</body>
</html>