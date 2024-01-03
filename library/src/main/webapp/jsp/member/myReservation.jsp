<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation</title>
</head>
<body>
<c:import url="/header" />
<c:import url="/userHeader"/>
<div align="center">
	<table>
		<tr>
			<td>회의실
			<td>예약일
			<td>예약시간
			<td>취소
		</tr>
		<c:forEach var="reservation" items="${reservations }">
			<tr>
				<td>${reservation.room_num }
				<td>${reservation.reservation_date }
				<td>${reservation.reservation_time }:00 ~ ${reservation.reservation_time+reservation.duration }:00
				<td><button type="button" 
				onclick="location.href='cancel?reservation_date=${reservation.reservation_date}&room_num=${reservation.room_num }'" >
				취소</button></td>
			</tr>
		</c:forEach>
	</table>
</div>
<c:import url="/userFooter"/>
<c:import url="/footer" />
</body>
</html>