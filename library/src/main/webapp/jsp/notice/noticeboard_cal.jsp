<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관 일정</title>
</head>


<body>
	<c:import url="/header" />
	<c:import url="/noticeheader" />
<script>
//기본 구성
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth'
	});
	calendar.render();
});

// db 연동
$(function() {
	var calendarEl = document.getElementById('calendar'); // calendarEl 변수를 이 위치로 이동
	var request = $.ajax({
		url: "/production/monthPlan",
		method: "GET",
		dataType: "json"
	});

	request.done(function(data) {
		console.log(data);

		// FullCalendar 이벤트로 변환
		var events = data.map(function(item) {
			return {
				start: item.expectedProductionStartDate,
				end: item.expectedProductionEndDate,
				title: item.productionPlanCode
			};
		});
		var events = [
			{
				start: '2024-01-19',
				end: '2024-01-19',
				title: '휴관일'
			},
			{
				start: '2024-01-19',
				end: '2024-01-19',
				title: '휴관일2'
			},
			{
				start: '2024-01-25',
				end: '2024-01-28',
				title: '문화의날 행사'
			},
			{
				start: '2024-02-06',
				end: '2024-02-06',
				title: 'KG도서관 발표일'
			}
			// 여러 이벤트를 추가할 수 있습니다.
			// {
			//   start: '다른 이벤트의 시작일',
			//   end: '다른 이벤트의 종료일',
			//   title: '다른 이벤트의 제목'
			// },
			// ...
		];
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: 'dayGridMonth',
			headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			events: events
		});

		calendar.render();
	});

	request.fail(function(jqXHR, textStatus) {
		alert("Request failed: " + textStatus);
	});
});
</script>

	<div id="cont_head">
		<h2>도서관 일정</h2>
		<!-- 현재위치 -->
		<div id="location">
			<ul>
				<li>홈</li>
				<li>이용자마당</li>
				<li class="now">도서관 일정</li>
			</ul>
		</div>
		<!-- //현재위치 -->
	</div>

	<div id="cont_wrap">
		<div id="board" style="width: 100%;">
			<!-- 캘린더 시작 -->
			<div id='calendar'></div>
			<!-- 캘린더 끝 -->
		</div>
	</div>
	<c:import url="/noticefooter" />
	<c:import url="/footer" />
</body>
</html>