<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 예약</title>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<c:import url="/header"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="reservation.js"></script>
<c:import url="/reservationheader"/>
	<div id="cont_head">
		<h2>회의실 예약</h2>
		<!-- 현재위치 -->
		<div id="location">
			<ul>
				<li>홈</li>
				<li>회의실</li>
				<li class="now">회의실 예약</li>
			</ul>
		</div>
		<!-- //현재위치 -->
	</div>
	<div id="cont_wrap">
	<form action="reservation" method='post'>
		날짜
		<input type="text" id="startDate" name="reservation_date">
		시간
		<select name="reservation_time">
			<option value="9">09시</option>
			<option value="10">10시</option>
			<option value="11">11시</option>
			<option value="12">12시</option>
			<option value="13">13시</option>
			<option value="14">14시</option>
			<option value="15">15시</option>
			<option value="16">16시</option>
			<option value="17">17시</option>
			<option value="18">18시</option>
			<option value="19">19시</option>
		</select>
		<button type="submit">조회</button>
	</form>
	<br></br>
	<c:if test="${not empty dto }">
		<form action="reservation2" method='post' id='f'>
		<div class="showSeatArea">		
			<c:forEach var="seat_class" items="10,20,30">
				<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="${seat_class }_div">
					<c:forEach var="s_no" begin="1" end="3">
						<input type="radio" class="btn-check" autocomplete="off" name="room_num"
						id="${seat_class }${s_no }" value="${seat_class }${s_no }">
						<label class="btn btn-outline-primary" for="${seat_class }${s_no }"
						 id="${seat_class }${s_no }_lb">${seat_class}${s_no }</label>
					</c:forEach>
				</div>
				<br>
				<br>
			</c:forEach>
		</div>
		<c:forEach var="s" items="${reservations}">
			<script>
			$("#${s}").attr("disabled",true)
			$("#${s}_lb").attr("class", "btn btn-secondary")
			</script>
		</c:forEach>
			<input type="hidden" name="reservation_time" value="${dto.reservation_time }">
			<input type="hidden" name="reservation_date" value="${dto.reservation_date }">
			<input type="submit" value="선택">
		</form>
	</c:if>
	</div>
<c:import url="/reservationfooter"/>
<c:import url="/footer"/>
</body>
</html>