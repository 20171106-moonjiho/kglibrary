<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/jsp/default/favicon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관 일정</title>
</head>
<body>
	<c:import url="/header" />
	<c:import url="/noticeheader" />
	<script src="notice_cal.js"></script>
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