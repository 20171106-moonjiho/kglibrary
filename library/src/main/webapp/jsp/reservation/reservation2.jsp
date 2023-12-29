<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room Reservation</title>
</head>
<c:import url="/header"/>
<body>
<div align="center">
	<table>
		<tr>
			<td rowspan="12"><img src="">
			<td>
		</tr>
		<c:forEach var="s" begin="9" end="19">
			<tr>
				<td>${s }:00 ~ ${s+1 }:00
				<td id="${s }" bgcolor="white">
			</tr>
		</c:forEach>
		<c:forEach var="s" items="${list}">
			<script>
			document.getElementById('${s}').setAttribute('bgcolor', 'green');
			</script>
		</c:forEach>
	</table>
	<form action="result" method='post'>
		<input type="hidden" name="room_num" value="${dto.room_num }">
		<input type="hidden" name="reservation_date" value="${dto.reservation_date }">
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
		<select name="duration">
			<option value="1">1시간</option>
			<option value="2">2시간</option>
			<option value="3">3시간</option>
		</select>
		<input type="submit">
	</form>
</div>
<c:import url="/footer"/>
</body>
</html>