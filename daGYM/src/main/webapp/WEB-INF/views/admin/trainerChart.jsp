<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너별 매출 조회</title>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../admin/sidebar.jsp"/>
		
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../admin/navbar.jsp"/>
			
			<div class="main-panel">
				<div class="content-wrapper">
		            <div class="page-header">
		              <h3 class="page-title">매출 조회</h3>
		            </div>
		            <div class="row">
		              <div class="col-lg-8 grid-margin stretch-card">
		                <div class="card">
		                  <div class="card-body">
		                    <h4 class="card-title">트레이너별 매출 조회</h4>
		                    <canvas id="trainerChart"></canvas>
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
		$(function() {
			var data = {
			    labels: ["트레이너1", "트레이너2", "트레이너3", "트레이너4", "트레이너5", "트레이너6"],
			    datasets: [{
			      label: '매출(단위 : 원)',
			      data: [4000000, 3000000, 2000000, 3000000, 4000000, 5000000],
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
			      borderWidth: 1,
			      fill: true
			    }]
			};
			
			var options = {
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
			    legend: {
			        display: false
			    },
			    elements: {
			        point: {
			          radius: 0
			        }
		      	}
			};
			
			if ($("#trainerChart").length) {
			    var barChartCanvas = $("#trainerChart").get(0).getContext("2d");
			    // This will get the first returned node in the jQuery collection.
			    var barChart = new Chart(barChartCanvas, {
			      type: 'bar',
			      data: data,
			      options: options
			    });
			}
		});
	</script>
</body>
</html>